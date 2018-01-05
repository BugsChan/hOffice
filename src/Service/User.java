package Service;

public class User {
	private String username;
	private int id;
	private String email;
	private String phoneNumber;
	private String password;
	private String QQNumber;
	private String WeChatNumber;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQQNumber() {
		return QQNumber;
	}
	public void setQQNumber(String qQNumber) {
		QQNumber = qQNumber;
	}
	public String getWeChatNumber() {
		return WeChatNumber;
	}
	public void setWeChatNumber(String weChatNumber) {
		WeChatNumber = weChatNumber;
	}
}
