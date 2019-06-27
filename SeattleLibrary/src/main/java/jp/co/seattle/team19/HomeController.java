package jp.co.seattle.team19;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "login";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("items", setSelectList());
		return "home1";
	}

	@RequestMapping(value = "home1", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("items", recently());
		model.addAttribute("i", m());
		model.addAttribute("t", k());
		return "home1";
	}


	@RequestMapping(value = "bookAdd", method = RequestMethod.GET)
	public String add(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "bookAdd";
	}

	@RequestMapping(value = "makeaccount", method = RequestMethod.GET)
	public String add1(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "account";
	}

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Transactional
	@RequestMapping(value = "account", method = RequestMethod.POST)
	public String newAccount(@RequestParam("name") String na, @RequestParam("mailname") String mail, @RequestParam("password1") String pass1, @RequestParam("password2") String pass2, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		List<Map<String,Object>> list = jdbcTemplate.queryForList("SELECT email FROM `library`.`user` WHERE email = '" + mail + "'");

		if(pass1.equals(pass2)) {
			if(list.size() == 0) {
				jdbcTemplate.update("INSERT INTO library.user(`user_name`,`email`,`password`) VALUES ('" + na + "','" + mail + "','" + pass1 + "')");
				model.addAttribute("resultMessage", "登録完了");
				model.addAttribute("items", recently());
				model.addAttribute("i", m());
				model.addAttribute("t", k());
			return "home1";
				}else{
					model.addAttribute("resultMessage", "既に登録済みです");
			return "account";
			}
		}else {
			model.addAttribute("resultMessage", "パスワードが一致していません");
			return "account";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String bookshelf(@RequestParam("mail") String m, @RequestParam("pass") String p,Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		try {
			@SuppressWarnings("unused")
			Map<String,Object> sql = jdbcTemplate.queryForMap("select email,password from library.user WHERE email = '" + m + "' AND password = '" + p + "'");
			model.addAttribute("items", recently());
			model.addAttribute("i", m());
			model.addAttribute("t", k());
			return "home1";
			}catch(Exception e){
			model.addAttribute("resultMessage", "パスワードが合っていません");
		return "login";
		}
	}

	@RequestMapping(value = "newlogin", method = RequestMethod.POST)
	public String newlogin(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "account";
	}

	@RequestMapping(value = "details", method = RequestMethod.POST)
	public String details(@RequestParam("book_id") String id1, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

			model.addAttribute("items", setList(id1));
			return "details";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)  //ファイルのアップロード//
	public String insert(@RequestParam("book_title") String title, @RequestParam("author") String aut, @RequestParam("publish") String pub, @RequestParam("explain") String exp, @RequestParam("upload_file") MultipartFile mul, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		String file;
		file = mul.getOriginalFilename();
		try {
		        File uploadFile = new File("/Applications/Eclipse_2019-03.app/Contents/workspace/SeattleLibrary/src/main/webapp/resources/get_image/" + file);
		        byte[] bytes = mul.getBytes();
		        BufferedOutputStream uploadFileStream = new BufferedOutputStream(new FileOutputStream(uploadFile));
		        uploadFileStream.write(bytes);
		        uploadFileStream.close();
		 		jdbcTemplate.update("INSERT INTO `library`.`bookshelf`(`book_title`,`author`,`publish`,`explain`,`images`) VALUES ('"+ title +"','"+ aut + "','" + pub + "','" + exp + "','" + file + "');");

		 		model.addAttribute("items", detail());
		} catch (Exception e) {
		         // 異常終了時の処理
		     } catch (Throwable t) {
		         // 異常終了時の処理
		     }
		return "details";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSample(@RequestParam("book_id") String pass, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

			model.addAttribute("items", setList(pass));
			return "bookAdd";
		}

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(@RequestParam("keyword") String key, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String sql = "" ;
		String[] up =	key.split(" ");

		for(int i = 0;i < up.length;i++) {
			if(i >= 1) {
			sql += "AND";
			}
			sql += "book_title LIKE '%" + up[i] + "%' OR author LIKE '%" + up[i]+ "%' OR publish LIKE '%" + up[i] + "%';";
		}

	model.addAttribute("items",setlist(sql));
	return "home1";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public String update(@RequestParam("book_title") String title,@RequestParam("author") String aut, @RequestParam("publish") String pub,  @RequestParam("explain") String exp, @RequestParam("book_id") String pasid, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		jdbcTemplate.update("UPDATE `library`.`bookshelf` SET `book_title` = '" + title + "',`author` = '" + aut + "',`publish` = '" + pub + "',`explain` = '" + exp + "' WHERE `book_id` = '" + pasid + "';");

		model.addAttribute("resultMessage", "更新完了");
		model.addAttribute("item", setList(pasid));

		return "details";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("book_id") String pasid,Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		// 本当は画面からパラメータを受け取って登録したい気分・・・
		jdbcTemplate.update("DELETE FROM library.bookshelf WHERE book_id = " + pasid + ";");

		model.addAttribute("resultMessage", "削除完了");
		model.addAttribute("items", recently());
		model.addAttribute("i", m());
		model.addAttribute("t", k());

		return "home1";
	}


	private List<Map<String, String>> setSelectList() {
		List<Map<String, String>> list = jdbcTemplate.query("select `book_id`,`book_title`,`author`,`publish`,`explain`,`images` from bookshelf where book_title != '';",
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;
	}

	private List<Map<String, String>> recently() {
		List<Map<String, String>> list = jdbcTemplate.query("select * from bookshelf WHERE book_title IS NOT NULL order by book_id desc limit 10",
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;
	}

	private List<Map<String, String>> m() {
		List<Map<String, String>> list = jdbcTemplate.query("select * from bookshelf where book_title like '%Major%' OR book_title like '%MAJOR%' OR book_title like '%メジャー%';",
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("i", rs.getString("images"));
						return map;
					}
				});
		return list;
	}

	private List<Map<String, String>> k() {
		List<Map<String, String>> list = jdbcTemplate.query("select * from bookshelf where book_title like '%キングダム%' OR book_title like '%kingdom%';",
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;
	}

	private List<Map<String, String>> setList(String id) {
		List<Map<String, String>> list = jdbcTemplate.query("select `book_id`,`book_title`,`author`,`publish`,`explain`,`images` from bookshelf where book_id ="+ id,
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;

	}

	private List<Map<String, String>> setlist(String keyword) {
		List<Map<String, String>> list = jdbcTemplate.query("select `book_id`,`book_title`,`author`,`publish`,`explain`,`images` from bookshelf where " + keyword,
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;
	}

	private List<Map<String, String>> detail() {
		List<Map<String, String>> list = jdbcTemplate.query("SELECT * from bookshelf where book_id = (select max(book_id) from bookshelf);",
				new RowMapper<Map<String, String>>() {
					@SuppressWarnings({ "rawtypes", "unchecked" })
					public Map<String, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, String> map = new HashMap();
						map.put("book_id", rs.getString("book_id"));
						map.put("book_title", rs.getString("book_title"));
						map.put("author", rs.getString("author"));
						map.put("publish", rs.getString("publish"));
						map.put("explain", rs.getString("explain"));
						map.put("images", rs.getString("images"));
						return map;
					}
				});
		return list;
	}
}
