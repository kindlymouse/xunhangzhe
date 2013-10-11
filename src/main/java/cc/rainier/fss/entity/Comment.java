package cc.rainier.fss.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

//JPA标识
@Entity
@Table(name = "fs_comment")
public class Comment extends IdEntity {

    private User user;
    private Attach attach;
    private String content;
//    private Comment toComment;
//    private User toUser;
    private Date ctime;
    private Integer flagDel;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public Integer getFlagDel() {
        return flagDel;
    }

    public void setFlagDel(Integer flagDel) {
        this.flagDel = flagDel;
    }

	// JSR303 BeanValidator的校验规则
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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


    // JPA 基于USER_ID列的多对一关系定义
    @ManyToOne
    @JoinColumn(name = "attach_id")
    public Attach getAttach() {
        return this.attach;
    }

    public void setAttach(Attach attach) {
        this.attach = attach;
    }
}
