package cc.rainier.fss.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

//JPA标识
@Entity
@Table(name = "fs_attach")
public class Attach extends IdEntity {

    private User user;
    private Date ctime;
    private String name;
    private String description;
    private String attachType;
    private String size;
    private String  extension;
    private Integer flagDel;
    private String  savePath;
    private String saveName;

    public Attach(){
    }
    public Attach(Long id){
        this.id = id;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAttachType() {
        return attachType;
    }

    public void setAttachType(String attachType) {
        this.attachType = attachType;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public Integer getFlagDel() {
        return flagDel;
    }

    public void setFlagDel(Integer flagDel) {
        this.flagDel = flagDel;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getSaveName() {
        return saveName;
    }

    public void setSaveName(String saveName) {
        this.saveName = saveName;
    }



	// JSR303 BeanValidator的校验规则
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	// JPA 基于USER_ID列的多对一关系定义
	@ManyToOne
	@JoinColumn(name = "uid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
