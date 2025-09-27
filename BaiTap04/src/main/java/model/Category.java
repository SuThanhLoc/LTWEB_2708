package model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cateid")
    private int cateid;
    
    @Column(name = "catename")
    private String catename;
    
    @Column(name = "icon")
    private String icon;
    
    @Column(name = "userId")
    private int userId;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "created_date")
    private Date createdDate;
	
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	// Convenience methods for compatibility
	public int getId() {
		return cateid;
	}
	public void setId(int id) {
		this.cateid = id;
	}
	public String getName() {
		return catename;
	}
	public void setName(String name) {
		this.catename = name;
	}

}
