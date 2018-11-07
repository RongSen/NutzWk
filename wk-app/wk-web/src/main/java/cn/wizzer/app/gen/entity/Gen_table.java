package cn.wizzer.app.gen.entity;

import cn.wizzer.app.gen.util.Utils;
import cn.wizzer.framework.base.model.BaseModel;
import org.nutz.dao.entity.annotation.*;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Table("gen_table")
public class Gen_table extends BaseModel implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column
    @Name
    @Comment("ID")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    @Prev(els = {@EL("uuid()")})
    private String id;

    @Column
    @Comment("名称")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String name;

    @Column
    @Comment("描述")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String comments;

    @Column
    @Comment("实体类名称")
    @ColDefine(type = ColType.VARCHAR, width = 100)
    private String className;

    @Column
    @Comment("关联父表")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String parentTable;

    @Column
    @Comment("关联父表外键")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String parentTableFk;

    @Column
    @Comment("创建人")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String createBy;

    @Column
    @Comment("创建时间")
    @ColDefine(type = ColType.DATETIME)
    private Timestamp createDate;

    @Column
    @Comment("更新人")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String updateBy;

    @Column
    @Comment("更新时间")
    @ColDefine(type = ColType.DATETIME)
    private Timestamp updateDate;

    @Column
    @Comment("备注")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String remark;

    public Gen_table() {
        Timestamp now = Utils.getTimestamp();

        this.id = "";
        this.name = "";
        this.comments = "";
        this.className = "";
        this.parentTable = "";
        this.parentTableFk = "";
        this.createBy = "";
        this.createDate = now;
        this.updateBy = "";
        this.updateDate = now;
        this.remark = "";
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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getParentTable() {
        return parentTable;
    }

    public void setParentTable(String parentTable) {
        this.parentTable = parentTable;
    }

    public String getParentTableFk() {
        return parentTableFk;
    }

    public void setParentTableFk(String parentTableFk) {
        this.parentTableFk = parentTableFk;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
