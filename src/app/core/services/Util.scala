package app.core.services

import java.util.Random
import java.util.UUID

object Util {

  def getUUID() = { UUID.randomUUID().toString().replace("-", "") }

}