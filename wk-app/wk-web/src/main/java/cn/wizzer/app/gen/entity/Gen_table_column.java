package cn.wizzer.app.gen.entity;

import cn.wizzer.app.gen.util.Utils;
import cn.wizzer.framework.base.model.BaseModel;
import org.nutz.dao.entity.annotation.*;

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
    @Comment("表名")
    @ColDefine(type = ColType.VARCHAR, width = 32)
    private String genTableId;

    @Column
    @Comment("列名")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String columnName;

    @Column
    @Comment("列排序(升序)")
    @ColDefine(type = ColType.FLOAT, width = 10)
    private Float columnSort;

    @Column
    @Comment("类型")
    @ColDefine(type = ColType.VARCHAR, width = 100)
    private String columnType;

    @Column
    @Comment("列标签名")
    @ColDefine(type = ColType.VARCHAR, width = 50)
    private String columnLabel;

    @Column
    @Comment("描述")
    @ColDefine(type = ColType.VARCHAR, width = 500)
    private String comments;

    @Column
    @Comment("类属性名")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String attrName;

    @Column
    @Comment("类属性类型")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String attrType;

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
    @Comment("是否更新字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isUpdate;

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
    @Comment("是否编辑字段")
    @ColDefine(type = ColType.CHAR, width = 1)
    private String isEdit;

    @Column
    @Comment("控件类型（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String showType;

    @Column
    @Comment("其他选项")
    @ColDefine(type = ColType.VARCHAR, width = 1000)
    private String options;

    @Column
    @Comment("字段类型")
    @ColDefine(type = ColType.VARCHAR, width = 200)
    private String dictType;

    @Column
    @Comment("其他设置（扩展字段JSON）")
    @ColDefine(type = ColType.VARCHAR, width = 2000)
    private String settings;

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
        this.columnName = "";
        this.columnSort = new Float(0.0);
        this.columnType = "";
        this.columnLabel = "";
        this.comments = "";
        this.attrName = "";
        this.attrType = "";

        this.isPk = "";
        this.isNull = "";
        this.isInsert ="";
        this.isUpdate = "";
        this.isList = "";
        this.isQuery = "";
        this.queryType = "";
        this.isEdit = "";
        this.showType = "";

        this.options = "";

        this.dictType = "";
        this.settings = "";
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

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public Float getColumnSort() {
        return columnSort;
    }

    public void setColumnSort(Float columnSort) {
        this.columnSort = columnSort;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getColumnLabel() {
        return columnLabel;
    }

    public void setColumnLabel(String columnLabel) {
        this.columnLabel = columnLabel;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    public String getAttrType() {
        return attrType;
    }

    public void setAttrType(String attrType) {
        this.attrType = attrType;
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

    public String getIsUpdate() {
        return isUpdate;
    }

    public void setIsUpdate(String isUpdate) {
        this.isUpdate = isUpdate;
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

    public String getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
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
