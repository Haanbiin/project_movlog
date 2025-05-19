package com.somo.login.dto;

import java.time.LocalDate;

/**
 * users 테이블과 1:1 매핑되는 DTO
 */
public class User {
	 private int id;
	    private String name;
	    private String email;
	    private String phone;
	    private LocalDate birthday;
	    private String gender;
	    private String password;
	    private String tags;
	    private String bio;
	    
	    
//--- getter, setter	    
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		public LocalDate getBirthday() {
			return birthday;
		}
		public void setBirthday(LocalDate birthday) {
			this.birthday = birthday;
		}
		
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		public String getTags() {
			return tags;
		}
		public void setTags(String tags) {
			this.tags = tags;
		}
		
		public String getBio() {
			return bio;
		}
		public void setBio(String bio) {
			this.bio = bio;
		}
//--- getter, setter ---//
		
//-- toString
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("User [id=");
			builder.append(id);
			builder.append(", name=");
			builder.append(name);
			builder.append(", email=");
			builder.append(email);
			builder.append(", phone=");
			builder.append(phone);
			builder.append(", birthday=");
			builder.append(birthday);
			builder.append(", gender=");
			builder.append(gender);
			builder.append(", password=");
			builder.append(password);
			builder.append(", tags=");
			builder.append(tags);
			builder.append(", bio=");
			builder.append(bio);
			builder.append("]");
			return builder.toString();
		}
//-- toString --//
		
		
		
		
		
		
		
		
		
}
