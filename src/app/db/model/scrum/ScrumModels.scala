package app.db.model.scrum

import scala.beans.BeanProperty

import app.db.model.user.AptbUser

class SutbCategory extends serializable {
  @BeanProperty var sutbCategoryId, sutbReportDetailId, category: String = _
}

class SutbReportDetail extends serializable {
  @BeanProperty var sutbReportDetailId, reportName, displayName, scrumMasterId, reportEvenDt, actSts, createdOn, updatedOn, createdBy, updatedBy: String = _
}

class SutbSubCategory extends serializable {
  @BeanProperty var sutbSubCategoryId, sutbCategoryId, subCategory: String = _
}

class SutbScrumUpdate extends serializable {
  @BeanProperty var sutbScrumUpdateId, memberId, updateTxt, hoursSpent, actSts, createdOn, updatedOn, createdBy, updatedBy: String = _

  @BeanProperty var sutbReportDetail: SutbReportDetail = null
  @BeanProperty var sutbCategory: SutbCategory = null
  @BeanProperty var sutbSubCategory: SutbSubCategory = null
  @BeanProperty var aptbUser: AptbUser = null
}