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
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String tableName;

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
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String parentTableName;

    @Column
    @Comment("关联父表外键")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String parentTableFkName;

    @Column
    @Comment("使用的模版")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String tplCategory;

    @Column
    @Comment("生成包路径")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String packageName;

    @Column
    @Comment("生成模块名")
    @ColDefine(type = ColType.VARCHAR, width = 30)
    private String moduleName;

    @Column
    @Comment("生成子模块名")
    @ColDefine(type = ColType.VARCHAR, width = 30)
    private String subModuleName;

    @Column
    @Comment("生成功能名")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String functionName;

    @Column
    @Comment("生成功能名(简写)")
    @ColDefine(type = ColType.VARCHAR, width = 50)
    private String functionNameSimple;

    @Column
    @Comment("生成功能作者")
    @ColDefine(type = ColType.VARCHAR, width = 50)
    private String functionAuthor;

    @Column
    @Comment("生成基础路径")
    @ColDefine(type = ColType.VARCHAR, width = 1000)
    private String genBaseDir;

    @Column
    @Comment("其他生成选项")
    @ColDefine(type = ColType.VARCHAR, width = 1000)
    private String options;

    @Column
    @Comment("创建者")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String createBy;

    @Column
    @Comment("创建时间")
    @ColDefine(type = ColType.DATETIME)
    private Timestamp createDate;

    @Column
    @Comment("更新者")
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
        this.tableName = "";
        this.comments = "";
        this.className = "";
        this.parentTableName = "";
        this.parentTableFkName = "";
        this.tplCategory = "";
        this.packageName = "";
        this.moduleName = "";
        this.subModuleName = "";
        this.functionName = "";
        this.functionNameSimple = "";
        this.functionAuthor = "";
        this.genBaseDir = "";
        this.options = "";
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

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
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

    public String getParentTableName() {
        return parentTableName;
    }

    public void setParentTableName(String parentTableName) {
        this.parentTableName = parentTableName;
    }

    public String getParentTableFkName() {
        return parentTableFkName;
    }

    public void setParentTableFkName(String parentTableFkName) {
        this.parentTableFkName = parentTableFkName;
    }

    public String getTplCategory() {
        return tplCategory;
    }

    public void setTplCategory(String tplCategory) {
        this.tplCategory = tplCategory;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getSubModuleName() {
        return subModuleName;
    }

    public void setSubModuleName(String subModuleName) {
        this.subModuleName = subModuleName;
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    public String getFunctionNameSimple() {
        return functionNameSimple;
    }

    public void setFunctionNameSimple(String functionNameSimple) {
        this.functionNameSimple = functionNameSimple;
    }

    public String getFunctionAuthor() {
        return functionAuthor;
    }

    public void setFunctionAuthor(String functionAuthor) {
        this.functionAuthor = functionAuthor;
    }

    public String getGenBaseDir() {
        return genBaseDir;
    }

    public void setGenBaseDir(String genBaseDir) {
        this.genBaseDir = genBaseDir;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
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
