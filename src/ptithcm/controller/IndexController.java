package ptithcm.controller;

import javax.transaction.Transactional;

import java.util.Date;
import java.util.List;

import org.apache.naming.factory.SendMailFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@Transactional
public class IndexController {
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("bicycles2")
	public String bicycles2(ModelMap model) {
		Session session= factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.type='street'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();
		model.addAttribute("products",list);
		return "bicycles2";
	}
//	@RequestMapping("/test/index")
//	public String indextest(ModelMap model) {
//		Session session= factory.getCurrentSession();
//		String hql = "FROM Products";
//		Query query = session.createQuery(hql);
//		List<Products> list = query.list();
//		for(int i =0; i< list.size();i++)
//		{
//			Products products = list.get(i);
//			System.out.println(products.getId()+"   "+products.getPhoto1());
//		}
//		model.addAttribute("products",list);
//		return "test/index";
//	}
//	
	@ModelAttribute("mountain")
	public List<Products> getMountainBike(){
		Session session= factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.type='Mountain'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();		
		return list;
	}
	@ModelAttribute("street")
	public List<Products> getStreetBike(){
		Session session= factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.type='Street'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();		
		return list;
	}
	@ModelAttribute("road")
	public List<Products> getRoadBike(){
		Session session= factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.type='Road'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();		
		return list;
	}
	
	@RequestMapping("bicycles")
	public String bicycles() {
		AdminController.checklogin = false;
		System.out.println(AdminController.checklogin);
		return "bicycles";
	}

	@RequestMapping(value="single", method=RequestMethod.GET)
	public String singles(ModelMap model, @RequestParam("id") String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.id='"+id+"'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();
		Products products = list.get(0);
		model.addAttribute("bike",products);
		return "single";
	}
	@RequestMapping(value="cart", method=RequestMethod.GET)
	public String cart(ModelMap model, @RequestParam("id") String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Products p WHERE p.id='"+id+"'";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();
		Products products = list.get(0);
		Orders orders = new Orders();
		orders.setProducts(products);
		model.addAttribute("bike",products);
		model.addAttribute("orders",orders);
		return "cart";
	}
	@RequestMapping(value="cart", method=RequestMethod.POST)
	public String cart(ModelMap model, @ModelAttribute("orders") Orders orders,BindingResult error) {
		
		
//		if (orders.getName().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN YOUR NAME!");
//		else if (orders.getPhone().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN YOUR PHONE NUMBER!");
//		else if (orders.getPhone().length() != 10) model.addAttribute("message","PLEASE FILL IN CORRECT PHONE NUMBER!");
//		else if (orders.getEmail().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN YOUR EMAIL ADDRESS!");
//		else if (orders.getAddress().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN YOUR ADDRESS!");
		if (orders.getName().isEmpty() == true) error.rejectValue("name","orders","PLEASE FILL IN YOUR NAME!");
		else if (orders.getPhone().isEmpty() == true) error.rejectValue("phone","orders","PLEASE FILL IN YOUR PHONE NUMBER!");
		else if (orders.getPhone().length() != 10) error.rejectValue("phone","orders","PLEASE FILL IN CORRECT PHONE NUMBER!");
		else if (orders.getEmail().isEmpty() == true) error.rejectValue("email","orders","PLEASE FILL IN YOUR EMAIL ADDRESS!");
		else if (orders.getAddress().isEmpty() == true)error.rejectValue("address","orders","PLEASE FILL IN YOUR ADDRESS!");
		if (error.hasErrors()) model.addAttribute("message","PLEASE CORRECT AND TRY AGAIN!");
		else {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		String hql = "UPDATE Products SET quantity = quantity - 1 WHERE id='"+orders.getProducts().getId()+"'";
		System.out.println(hql);
		Query query = session.createQuery(hql);
		System.out.println(orders.getName()+"  "+orders.getPhone()+"  "+orders.getEmail()+"   "+orders.getAddress());
		try {
			orders.setDatefound(new Date());
			orders.setStatus(false);
			session.save(orders);
			int rows = query.executeUpdate();
			if (rows != 0) System.out.println("Thay doi quatity thanh cong");
			SendMail(orders);
			transaction.commit();
			model.addAttribute("message","Order has been placed");
		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
			model.addAttribute("message","Order failed");
		}
		session.close();
		}
		return "cart";
	}
	public boolean SendMail(Orders orders) {
		boolean check = false;
		String from ="shynhyn319@gmail.com";
		String subject = "ORDER INFORMATION - FOR BUYER";
		String status;
		if (!orders.getStatus()) status ="Order received";
		else status="The order has been delivered";
		String body = String.format("Hello "+orders.getName()+",\nThanks for ordering, here is the order details"+"\n%-20s%-30s\n%-20s%-30s\n%-20s%-30s\n%-20s%-30s\n%-20s%-30s"
                ,"Model code:",orders.getProducts().getId(),"Order date:",orders.getDatefound().toString(),"Address:",orders.getAddress(),"Phone:",orders.getPhone()
                ,"Status:",status);
		try {
			mailer.send(from, orders.getEmail(), subject, body);
			check = true;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Send ERROR");
			
		}
		return check;
	}
	@RequestMapping(value="order", method=RequestMethod.GET)
	public String orders(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Orders";
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();
		Orders orders = list.get(0);
		model.addAttribute("order",orders);
		return "test/index";
	}
}
