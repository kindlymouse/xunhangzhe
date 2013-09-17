package cc.rainier.fss.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: zzyang
 * Date: 13-9-12
 * Time: 下午5:14
 * To change this template use File | Settings | File Templates.
 */
@javax.persistence.Table(name = "fs_brief")
@Entity
public class Brief extends IdEntity {
    private Integer id;
    private String title;
    private String content;
    private User sysFillUser;
    private Date sysFillTime;

    public String getTitle() {
        return title;
    }
    @NotBlank
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }
    @NotBlank
    public void setContent(String content) {
        this.content = content;
    }

    @ManyToOne
    @JoinColumn(name = "sys_fill_user_id")
    public User getSysFillUser() {
        return this.sysFillUser;
    }

    public void setSysFillUser(User sysFillUser) {
        this.sysFillUser = sysFillUser;
    }


    @javax.persistence.Column(name = "sys_fill_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    public Date getSysFillTime() {
        return sysFillTime;
    }

    public void setSysFillTime(Date sysFillTime) {
        this.sysFillTime = sysFillTime;
    }

}
