package app.db.model.master

import scala.beans.BeanProperty
import java.io.Serializable

class SutbWorkingDays extends Serializable  {
  @BeanProperty var sutbWorkingDaysId, weekDay: String = _
}

class TktbCategory extends Serializable {
  @BeanProperty var tktbCategoryId, category, actSts: String = _
}

class TktbEnvironment extends Serializable {
  @BeanProperty var tktbEnvironmentId, environment, actSts: String = _
}

class TktbProduct extends Serializable {
  @BeanProperty var tktbProductId, product, actSts: String = _
}