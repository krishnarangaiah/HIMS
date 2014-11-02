package app.db.model.scrum

import scala.beans.BeanProperty
import java.io.Serializable
import app.db.model.user.AptbUser

class SutbCategory extends Serializable {
  @BeanProperty var sutbCategoryId, sutbReportDetailId, category: String = _
}

class SutbReportDetail extends Serializable {
  @BeanProperty var sutbReportDetailId, reportName, displayName, scrumMasterId, reportEvenDt, actSts, createdOn, updatedOn, createdBy, updatedBy: String = _
}

class SutbSubCategory extends Serializable {
  @BeanProperty var sutbSubCategoryId, sutbCategoryId, subCategory: String = _
}

class SutbScrumUpdate extends Serializable {
  @BeanProperty var sutbScrumUpdateId, memberId, updateTxt, hoursSpent, actSts, createdOn, updatedOn, createdBy, updatedBy: String = _

  @BeanProperty var sutbReportDetail: SutbReportDetail = null
  @BeanProperty var sutbCategory: SutbCategory = null
  @BeanProperty var sutbSubCategory: SutbSubCategory = null
  @BeanProperty var aptbUser: AptbUser = null
}