package somaerequest;

import java.sql.Timestamp;

public class SomaeDTO {

	private String id;							// id
	private String name;					//	��ǥ�ڸ�
	private String passwd1;				// ��й�ȣ
	private String passwd2;				// ��й�ȣ Ȯ��â
	private String job_name;				// ��ȣ��
	private String job_value;			// ����ڵ�Ϲ�ȣ
	private String academy;				// ����
	private String tel1;						// ��ȭ��ȣ ���Ͼ��ڸ�
	private String tel2;						// ��ȭ��ȣ ����ڸ�
	private String tel3;						// ��ȭ��ȣ ���ϳ��ڸ�
	private String what;						// �ڵ��� ȸ��(SKT?KTF?LG?)
	private String phone1;				// �ڵ��� ���Ͼ��ڸ�
	private String phone2;				// �ڵ��� ����ڸ�
	private String phone3;				// �ڵ��� ���ϳ��ڸ�
	private String email;					// �̸����ּ� ���̵�
	private String site;						// �̸����ּ� ����Ʈ ����
	private String email2;					// �̸����ּ� URL �ԷµǴ°�
	private String sangsae;				// �ּ� DB���� �ԷµǴ� ��
	private String address;				// �ּ� ���ּ�
	private String zip;						// �ּ� �����ȣ 
	private Timestamp time;				// ȸ������ ��û �ð� �� �ޱ�
	private String tel;
	private String fullemail;
	private String phone;
	

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFullemail() {
		return fullemail;
	}
	public void setFullemail(String fullemail) {
		this.fullemail = fullemail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Timestamp getTime() {
		return time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd1() {
		return passwd1;
	}
	public void setPasswd1(String passwd1) {
		this.passwd1 = passwd1;
	}
	public String getPasswd2() {
		return passwd2;
	}
	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getJob_value() {
		return job_value;
	}
	public void setJob_value(String job_value) {
		this.job_value = job_value;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getWhat() {
		return what;
	}
	public void setWhat(String what) {
		this.what = what;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getSangsae() {
		return sangsae;
	}
	public void setSangsae(String sangsae) {
		this.sangsae = sangsae;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
}
