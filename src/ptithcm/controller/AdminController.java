package ptithcm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
public class AdminController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	
	public static boolean checklogin = false; 
	
	@RequestMapping("admin")
	public String admin(ModelMap model) {
		if (checklogin == true) 
			return "admin/order";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(ModelMap model) {
		Users users = new Users();
		model.addAttribute("login",users);
		return "admin/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login1(ModelMap model, @ModelAttribute("login")Users users) {
		if (users.getUsername().isBlank()) model.addAttribute("message","Username is empty! Please fill in");
		else if (users.getPassword().isBlank()) model.addAttribute("message","Password is empty! Please fill in");
		else {
			Session session= factory.getCurrentSession();
			String hql = "FROM Users";
			Query query = session.createQuery(hql);
			List<Users> list = query.list();
			for (int i=0; i<list.size();i++) {
				if (list.get(i).getUsername().equalsIgnoreCase(users.getUsername())){
					if (list.get(i).getPassword().equalsIgnoreCase(users.getPassword())) {
						checklogin = true;
						return "admin/order";
					}
					else {
						model.addAttribute("message","WRONG PASSWORD");
						return "admin/login";
					}
				}
				else {
					model.addAttribute("message","USERNAME DOES NOT EXIST");
				}
			}
		}
		return "admin/login";
	}
	
	@RequestMapping("changetoproduct")
	public String changetoproduct(ModelMap model) {
		if (checklogin == true) 
			return "admin/product";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	
	@RequestMapping("changetoorder")
	public String changetoorder(ModelMap model) {
		if (checklogin == true) 
			return "admin/order";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	@RequestMapping("order")
	public String order(ModelMap model) {
		if (checklogin == true) 
			return "admin/order";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	
	@RequestMapping("product")
	public String product(ModelMap model) {
		if (checklogin == true) 
			return "admin/product";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	@RequestMapping(value="editproduct", method=RequestMethod.GET)
	public String edit(ModelMap model, @RequestParam("id") String id) {
		if (checklogin == true) {
			Session session = factory.getCurrentSession();
			String hql = "FROM Products p WHERE p.id='"+id+"'";
			Query query = session.createQuery(hql);
			List<Products> list = query.list();
			Products products = list.get(0);
			model.addAttribute("bike",products);
			return "admin/edit";
		}
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	@RequestMapping(value="editproduct", method=RequestMethod.POST)
	public String edit1(ModelMap model, @ModelAttribute("bike") Products products,BindingResult error) {
//		if (products.getId().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN PRODUCT'S ID!");
//		else if (products.getName().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN PRODUCT'S NAME!");
//		else if (products.getType().isEmpty() == true) model.addAttribute("message","PLEASE CHOOSE PRODUCT'S TYPE!");
		
	
		if (products.getName().isEmpty() == true) error.rejectValue("name","products","PLEASE FILL IN PRODUCT'S NAME!");
		else if (products.getType().isEmpty() == true) error.rejectValue("type","products","PLEASE CHOOSE PRODUCT'S TYPE!");
		else if (products.getBrand().isEmpty() == true) error.rejectValue("brand","products","PLEASE FILL IN PRODUCT'S BRAND!");
		if (error.hasErrors()) model.addAttribute("message","PLEASE CORRECT AND TRY AGAIN!");
		else {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		System.out.println(products.getId()+"  "+products.getName()+"  "+products.getPrice()+"   "+products.getPhoto1());
		try {
			session.update(products);
			transaction.commit();
			model.addAttribute("message","EDIT SUCCESS");
		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
			model.addAttribute("message","EDIT FAILED");
			System.out.println(e.getMessage());
		}
		session.close();
		}
		return "admin/edit";
	}

	@RequestMapping(value="deleteproduct", method=RequestMethod.GET)
	public String deleteproduct(ModelMap model,RedirectAttributes redirect, @RequestParam("id") String id) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		String hql = "DELETE FROM Products WHERE id= '" + id+"'";
		Query query = session.createQuery(hql);
		try {
			int rows = query.executeUpdate();
			transaction.commit();
			if (rows != 0)
				{
				model.addAttribute("message","DELETE PRODUCT SUCCESS!");
				redirect.addFlashAttribute("message","DELETE PRODUCT SUCCESS!");
				}
		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
			model.addAttribute("message","DELETE PRODUCT FAILED! THIS PRODUCT IS HAVING ORDER!");
			redirect.addFlashAttribute("message","DELETE PRODUCT FAILED! THIS PRODUCT IS HAVING ORDER!");
		}
		finally {
			session.close();
		}
		return "redirect:/product.htm";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(ModelMap model) {
		if (checklogin == true) {
			model.addAttribute("bike", new Products());
			return "admin/insert";
		}
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert1(ModelMap model, @ModelAttribute("bike") Products products,BindingResult error) {
		if (checkId(products.getId()) == true) error.rejectValue("id","products","MODEL ALREADY EXISTS!");
//		else if (products.getId().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN PRODUCT'S ID!");
//		else if (products.getName().isEmpty() == true) model.addAttribute("message","PLEASE FILL IN PRODUCT'S NAME!");
//		else if (products.getType().isEmpty() == true) model.addAttribute("message","PLEASE CHOOSE PRODUCT'S TYPE!");
		System.out.println(products.getType());
		if (products.getId().isEmpty() == true) error.rejectValue("id","products","PLEASE FILL IN PRODUCT'S ID!");
		else if (products.getName().isEmpty() == true) error.rejectValue("name","products","PLEASE FILL IN PRODUCT'S NAME!");
		else if (products.getType().isEmpty() == true) error.rejectValue("type","products","PLEASE CHOOSE PRODUCT'S TYPE!");
		else if (products.getBrand().isEmpty() == true) error.rejectValue("brand","products","PLEASE FILL IN PRODUCT'S BRAND");
		if (error.hasErrors()) model.addAttribute("message","PLEASE CORRECT AND TRY AGAIN!");
		else {	
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
			
				session.save(products);
				transaction.commit();
				model.addAttribute("message","ADDING SUCCESS!");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				transaction.rollback();
				System.out.println("E1");
				model.addAttribute("message","ADDING FAILED!");
			}
			finally {
				try {
					if(session.isOpen())
					session.close();
				} catch (Exception e2) {
					// TODO: handle exception
					System.out.println(e2.getMessage());
				}
			}
		}		
		return "admin/insert";
	}

	public boolean checkId(String id) {
		boolean check = false;
		Session session = factory.getCurrentSession();
		String hql= "from Products";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();
		for(int i =0; i< list.size();i++) {
			if (list.get(i).getId().equalsIgnoreCase(id)) check= true;
		}
		//session.close();
		return check;
	}
	@RequestMapping(value="importfile", method=RequestMethod.GET)
	public String importFile(ModelMap model) {
		if (checklogin == true) 
			return "admin/importfile";
		else {
			Users users = new Users();
			model.addAttribute("login",users);
			return "admin/login";
		}
		
	}
	@RequestMapping(value="importfile", method=RequestMethod.POST)
	public String importFile1(ModelMap model, @ModelAttribute("photo1") MultipartFile photo1, @ModelAttribute("photo2") MultipartFile photo2
			, @ModelAttribute("photo3") MultipartFile photo3, @ModelAttribute("photo4") MultipartFile photo4) {
		if(photo1.isEmpty() || photo2.isEmpty() || photo3.isEmpty() || photo4.isEmpty()) {
			model.addAttribute("message","Please choose 4 images!");
		}
		else if(((photo1.getContentType().contains("jpg")) || (photo1.getContentType().contains("jpeg"))) 
				&& ((photo2.getContentType().contains("jpg")) || (photo2.getContentType().contains("jpeg")))
						&& ((photo3.getContentType().contains("jpg")) || (photo3.getContentType().contains("jpeg")))		
								&& ((photo4.getContentType().contains("jpg")) || (photo4.getContentType().contains("jpeg")))
										){
			try {
		        Date date = Calendar.getInstance().getTime();  
				DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");  
				String strDate = dateFormat.format(date);
				String photoPath1= context.getRealPath("/images/"+strDate+"a");
				photo1.transferTo(new File(photoPath1));
				String photoPath2= context.getRealPath("/images/"+strDate+"b");
				photo2.transferTo(new File(photoPath2));
				String photoPath3= context.getRealPath("/images/"+strDate+"c");
				photo3.transferTo(new File(photoPath3));
				String photoPath4= context.getRealPath("/images/"+strDate+"d");
				photo4.transferTo(new File(photoPath4));
				Products products = new Products();
				products.setPhoto1("images/"+strDate+"a");
				products.setPhoto2("images/"+strDate+"b");
				products.setPhoto3("images/"+strDate+"c");
				products.setPhoto4("images/"+strDate+"d");
				model.addAttribute("bike",products);
				return "admin/insert";
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("message","Save file error!");
				System.out.println(e.toString());
			}
		}
		else {
			model.addAttribute("message","DOES NOT SUPPORT THIS FILE FORMAT! PLEASE SELECT JPG OR JPEG");
		}
		return "admin/importfile";
	}
	
	@RequestMapping(value="editstatus", method=RequestMethod.GET)
	public String changeStatus(ModelMap model, @RequestParam("id") String id) {
		
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "UPDATE Orders SET status= '1' where id= '" + id+"'";
			Query query = session.createQuery(hql);
			try {
				int rows = query.executeUpdate();
				transaction.commit();
				if (rows != 0) model.addAttribute("message","CHANGE STATUS SUCCESS!");
			} catch (Exception e) {
				// TODO: handle exception
				transaction.rollback();
				model.addAttribute("message","CHANGE STATUS FAILED!");
			}
			finally {
				session.close();
			}
			return "redirect:/admin.htm";
		
		
	}
	
	@RequestMapping(value="deleteorder", method=RequestMethod.GET)
	public String deleteorder(ModelMap model, @RequestParam("id") String id) {
		
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "DELETE FROM Orders WHERE id= '" + id+"'";
			Query query = session.createQuery(hql);
			try {
				int rows = query.executeUpdate();
				transaction.commit();
				if (rows != 0) model.addAttribute("message","DELETE ORDER SUCCESS!");
			} catch (Exception e) {
				// TODO: handle exception
				transaction.rollback();
				model.addAttribute("message","DELETE ORDER FAILED!");
			}
			finally {
				session.close();
			}
			return "redirect:/admin.htm";
		
		
	}
	
	@ModelAttribute("products")
	public List<Products> getProducts(){
		Session session= factory.getCurrentSession();
		String hql = "FROM Products";
		Query query = session.createQuery(hql);
		List<Products> list = query.list();		
		return list;
	}
	@ModelAttribute("orders")
	public List<Orders> getOrders(){
		Session session= factory.getCurrentSession();
		String hql = "FROM Orders";
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();		
		return list;
	}
}
