package cn.wizzer.app.gen.entity;

import cn.wizzer.app.gen.util.Utils;
import cn.wizzer.framework.base.model.BaseModel;
import org.nutz.dao.entity.annotation.*;
import org.nutz.lang.Times;

import java.io.Serializable;
import java.sql.Timestamp;

@Table("gen_table_column")
public class Gen_table_column extends BaseModel implements Serializable {

    private static final long serialVersioUID = 1L;

    @Column
    @Name
    @Comment("ID")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    @Prev(els = {@EL("uuid()")})
    private String id;

    @Column
    @Name
    @Comment("归属表ID")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String genTableId;

    @Column
    @Comment("name")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String name;

    @Column
    @Comment("描述")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String comment;

    @Column
    @Comment("jdbcType")
    @ColDefine(type = ColType.VARCHAR, width = 100)
    private String jdbcType;

    @Column
    @Comment("javaType")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String javaType;

    @Column
    @Comment("JAVA字段名称")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String javaField;

    @Column
    @Comment("是否主键")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isPk;

    @Column
    @Comment("是否可为空")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isNull;

    @Column
    @Comment("是否插入字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isInsert;

    @Column
    @Comment("是否编辑字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isEdit;

    @Column
    @Comment("是否列表字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isList;

    @Column
    @Comment("是否查询字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isQuery;

    @Column
    @Comment("查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String queryType;

    @Column
    @Comment("字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String showType;

    @Column
    @Comment("字段类型")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String dictType;

    @Column
    @Comment("其他设置（扩展字段JSON）")
    @ColDefine(type = ColType.VARCHAR, width = 2000)
    private String settings;

    @Column
    @Comment("排序")
    @ColDefine(type = ColType.FLOAT, width = 10)
    private Float sort;

    @Column
    @Comment("备注")
    @ColDefine(type = ColType.VARCHAR, width = 255)
    private String remark;

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

    public Gen_table_column() {
        this.id = "";
        this.genTableId = "";
        this.name = "";
        this.comment = "";
        this.jdbcType = "";
        this.javaType = "";
        this.javaField = "";
        this.isPk = "";
        this.isNull = "";
        this.isInsert ="";
        this.isEdit = "";
        this.isList = "";
        this.isQuery = "";
        this.queryType = "";
        this.showType = "";
        this.dictType = "";
        this.settings = "";
        this.sort = new Float(0.0);
        this.remark = "";

        Timestamp now = Utils.getTimestamp();

        this.createBy = "";
        this.createDate = now;
        this.updateBy = "";
        this.updateDate = now;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGenTableId() {
        return genTableId;
    }

    public void setGenTableId(String genTableId) {
        this.genTableId = genTableId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getJdbcType() {
        return jdbcType;
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getJavaField() {
        return javaField;
    }

    public void setJavaField(String javaField) {
        this.javaField = javaField;
    }

    public String getIsPk() {
        return isPk;
    }

    public void setIsPk(String isPk) {
        this.isPk = isPk;
    }

    public String getIsNull() {
        return isNull;
    }

    public void setIsNull(String isNull) {
        this.isNull = isNull;
    }

    public String getIsInsert() {
        return isInsert;
    }

    public void setIsInsert(String isInsert) {
        this.isInsert = isInsert;
    }

    public String getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit;
    }

    public String getIsList() {
        return isList;
    }

    public void setIsList(String isList) {
        this.isList = isList;
    }

    public String getIsQuery() {
        return isQuery;
    }

    public void setIsQuery(String isQuery) {
        this.isQuery = isQuery;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getSettings() {
        return settings;
    }

    public void setSettings(String settings) {
        this.settings = settings;
    }

    public Float getSort() {
        return sort;
    }

    public void setSort(Float sort) {
        this.sort = sort;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
}
