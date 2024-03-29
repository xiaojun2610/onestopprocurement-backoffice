package com.huaxin.onestopprocurementbackoffice.po;

import java.util.ArrayList;
import java.util.List;

public class CartExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CartExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andItemIdIsNull() {
            addCriterion("item-id is null");
            return (Criteria) this;
        }

        public Criteria andItemIdIsNotNull() {
            addCriterion("item-id is not null");
            return (Criteria) this;
        }

        public Criteria andItemIdEqualTo(Integer value) {
            addCriterion("item-id =", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotEqualTo(Integer value) {
            addCriterion("item-id <>", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThan(Integer value) {
            addCriterion("item-id >", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("item-id >=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThan(Integer value) {
            addCriterion("item-id <", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThanOrEqualTo(Integer value) {
            addCriterion("item-id <=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdIn(List<Integer> values) {
            addCriterion("item-id in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotIn(List<Integer> values) {
            addCriterion("item-id not in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdBetween(Integer value1, Integer value2) {
            addCriterion("item-id between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotBetween(Integer value1, Integer value2) {
            addCriterion("item-id not between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user-id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user-id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user-id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user-id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user-id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user-id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user-id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user-id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user-id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user-id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user-id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user-id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andItemNumbleIsNull() {
            addCriterion("item-numble is null");
            return (Criteria) this;
        }

        public Criteria andItemNumbleIsNotNull() {
            addCriterion("item-numble is not null");
            return (Criteria) this;
        }

        public Criteria andItemNumbleEqualTo(Integer value) {
            addCriterion("item-numble =", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleNotEqualTo(Integer value) {
            addCriterion("item-numble <>", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleGreaterThan(Integer value) {
            addCriterion("item-numble >", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleGreaterThanOrEqualTo(Integer value) {
            addCriterion("item-numble >=", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleLessThan(Integer value) {
            addCriterion("item-numble <", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleLessThanOrEqualTo(Integer value) {
            addCriterion("item-numble <=", value, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleIn(List<Integer> values) {
            addCriterion("item-numble in", values, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleNotIn(List<Integer> values) {
            addCriterion("item-numble not in", values, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleBetween(Integer value1, Integer value2) {
            addCriterion("item-numble between", value1, value2, "itemNumble");
            return (Criteria) this;
        }

        public Criteria andItemNumbleNotBetween(Integer value1, Integer value2) {
            addCriterion("item-numble not between", value1, value2, "itemNumble");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}