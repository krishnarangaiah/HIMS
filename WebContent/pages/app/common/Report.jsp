<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="/pages/library/PageLibs.jsp"%>

<%DateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm a");%>

        <table style="font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight: bold; border: 1px solid lightgray; border-collapse: collapse; width: 75%">
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Customer Site</td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"><s:property value="siteCode"/></td></tr>
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Site SPC</td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"></td></tr>
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Status Report Period</td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"><s:property value="session.get(\"REPORT_PERIOD\").getStartDate()" /> TO <s:property value="session.get(\"REPORT_PERIOD\").getEndDate()" /></td></tr>
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Report Prepared on</td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"><%= df.format(new Date()) %></td></tr>
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Prepared By </td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"><s:property value='session.get("SESSION_USER").getFullName()'/></td></tr>
            <tr><td style="width: 50%;text-align: right; border: 1px solid lightgray; padding: 0.15em; padding-right: 1em;">Reviewed By</td><td style = "width: 50%;text-align: left; border: 1px solid lightgray; padding: 0.15em; padding-left: 1em;"></td></tr>
        </table> 

<br/><br/>

  <span style="font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight: bold;">(A) Issues Status for the Period by Priority</span>
        <br clear="all"/>
        <br/>
        
  <table  id="executiveSummary" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse; width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;"><strong>Status</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>Issues Carried Fwd from Last period</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>New Issues Opened</strong></td>
                <td width="126" style="border:1px solid #000000;"><strong>Issues Concluded in period </strong></td>
                <td width="111" style="border:1px solid #000000;"><strong>Issues open at the end of the period.</strong></td>
            </tr>
            <s:iterator value="executiveSummaries">
                <tr style="text-align:center;">
                    <td width="126" style="border:1px solid #000000;"><s:property value="criticality"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="issuesCarried"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="issuesNew"/></td>
                    <td width="126" style="border:1px solid #000000;"><s:property value="issuesConcluded"/></td>
                    <td width="111" style="border:1px solid #000000;"><s:property value="issuesOpen"/></td>
                </tr>
            </s:iterator>    
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Grand Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
  </table>

<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(B) Issues Current Status</span>
<br clear="all" />
<br />

<table id="pendingSummary" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;"><strong>Pending With</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>Emergency</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>High/CFL</strong></td>
                <td width="126" style="border:1px solid #000000;"><strong>Medium</strong></td>
                <td width="111" style="border:1px solid #000000;"><strong>Low</strong></td>
                <td width="111" style="border:1px solid #000000; background-color:#DBDBDB;"><strong>Grand Total</strong></td>
            </tr>
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">OFSS</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>   
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
            <s:iterator value="ofssPendingSummaries">
                <tr style="text-align:center;">
                    <td width="126" style="border:1px solid #000000;"><s:property value="Status"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="Emergency"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="High"/></td>
                    <td width="126" style="border:1px solid #000000;"><s:property value="Medium"/></td>
                    <td width="111" style="border:1px solid #000000;"><s:property value="Low"/></td>
                    <td width="111" style="border:1px solid #000000;"></td>
                </tr>
            </s:iterator> 
            <tr style="background-color:#F5F5F5; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>  
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Site</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>   
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
             <s:iterator value="sitePendingSummaries">
                <tr style="text-align:center;">
                    <td width="126" style="border:1px solid #000000;"><s:property value="Status"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="Emergency"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="High"/></td>
                    <td width="126" style="border:1px solid #000000;"><s:property value="Medium"/></td>
                    <td width="111" style="border:1px solid #000000;"><s:property value="Low"/></td>
                    <td width="111" style="border:1px solid #000000;"></td>
                </tr>
            </s:iterator> 
            <tr style="background-color:#F5F5F5; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td> 
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Others</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>   
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
            <s:iterator value="othersPendingSummaries">
                <tr style="text-align:center;">
                    <td width="126" style="border:1px solid #000000;"><s:property value="Status"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="Emergency"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="High"/></td>
                    <td width="126" style="border:1px solid #000000;"><s:property value="Medium"/></td>
                    <td width="111" style="border:1px solid #000000;"><s:property value="Low"/></td>
                    <td width="111" style="border:1px solid #000000;"></td>
                </tr>
            </s:iterator>  
            <tr style="background-color:#F5F5F5; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>  
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Grand Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>  
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
        </table>

<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(C) Aging Analysis</span>
<br clear="all" />
<br />


<table id="ageSlabSummary" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;"><strong>Age Slab</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>Emergency</strong></td>
                <td width="125" style="border:1px solid #000000;"><strong>High</strong></td>
                <td width="126" style="border:1px solid #000000;"><strong>Medium</strong></td>
                <td width="111" style="border:1px solid #000000;"><strong>Low</strong></td>
                <td width="111" style="border:1px solid #000000;"><strong>Grand Total</strong></td>
            </tr>
            <s:iterator value="agingSummaries">
                <tr style="text-align:center;">
                    <td width="126" style="border:1px solid #000000;"><s:property value="ageSlab"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="emergency"/></td>
                    <td width="125" style="border:1px solid #000000;"><s:property value="high"/></td>
                    <td width="126" style="border:1px solid #000000;"><s:property value="med"/></td>
                    <td width="111" style="border:1px solid #000000;"><s:property value="low"/></td>
                    <td width="111" style="border:1px solid #000000;"></td>
                </tr>
            </s:iterator> 
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="126" style="border:1px solid #000000;">Grand Total</td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="125" style="border:1px solid #000000;"><b></b></td>
                <td width="126" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>
                <td width="111" style="border:1px solid #000000;"><b></b></td>
            </tr>
        </table>

<script type="text/javascript">

/* ************************************************************************************************ *
 * Executive Summary
 * ************************************************************************************************ */
  var table = document.getElementById("executiveSummary");    
  var tbody = table.getElementsByTagName("tbody")[0];
  var rows = tbody.getElementsByTagName("tr");
  
  var summaryTotaling = 0;
  
  for (var i = 1; i < rows.length; i++) {
      summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[1].firstChild.nodeValue);                 
      if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
          rows[i].getElementsByTagName("td")[1].innerHTML  = summaryTotaling;
          summaryTotaling = 0;
      }
  }
  
  for ( var i=1; i < rows.length; i++) {
      summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[2].firstChild.nodeValue);                 
      if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
          rows[i].getElementsByTagName("td")[2].innerHTML  = summaryTotaling;
          summaryTotaling = 0;
      }
  } 

  for ( var i=1; i < rows.length; i++) {
      summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[3].firstChild.nodeValue);                 
      if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
          rows[i].getElementsByTagName("td")[3].innerHTML  = summaryTotaling;
          summaryTotaling = 0;
      }
  }

  for ( var i=1; i < rows.length; i++) {
      summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[4].firstChild.nodeValue);                 
      if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
          rows[i].getElementsByTagName("td")[4].innerHTML  = summaryTotaling;
          summaryTotaling = 0;
      }
  }
  
  rows[rows.length-1].style.fontWeight = "BOLD";
  rows[rows.length-1].style.color = "#016795";
  
  
  /* ************************************************************************************************ *
   * Pending Summary
   * ************************************************************************************************ */
   
   var table = document.getElementById("pendingSummary");    
   var tbody = table.getElementsByTagName("tbody")[0];
   var rows = tbody.getElementsByTagName("tr");
   var grandTotalValue = 0;

   for ( var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[1].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Total'){            
           rows[i].getElementsByTagName("td")[1].innerHTML  = summaryTotaling;
           grandTotalValue = grandTotalValue + summaryTotaling;
           summaryTotaling = 0;
       }else if (rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){
           rows[i].getElementsByTagName("td")[1].innerHTML  = grandTotalValue;
           grandTotalValue = 0;
       }
   }    
   for ( var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[2].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Total'){            
           rows[i].getElementsByTagName("td")[2].innerHTML  = summaryTotaling;
           grandTotalValue = grandTotalValue + summaryTotaling;
           summaryTotaling = 0;
       }else if (rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){
           rows[i].getElementsByTagName("td")[2].innerHTML  = grandTotalValue;
           grandTotalValue = 0;        
       }
   }    
   for ( var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[3].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Total'){            
           rows[i].getElementsByTagName("td")[3].innerHTML  = summaryTotaling;
           grandTotalValue = grandTotalValue + summaryTotaling;
           summaryTotaling = 0;
       }else if (rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){
           rows[i].getElementsByTagName("td")[3].innerHTML  = grandTotalValue;
           grandTotalValue = 0;
       }
   }  
   for ( var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[4].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Total'){            
           rows[i].getElementsByTagName("td")[4].innerHTML  = summaryTotaling;
           grandTotalValue = grandTotalValue + summaryTotaling;
           summaryTotaling = 0;
       }else if (rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){
           rows[i].getElementsByTagName("td")[4].innerHTML  = grandTotalValue;
           grandTotalValue = 0;
       }
   }  

   for ( var i=1; i < rows.length; i++) {
       rows[i].getElementsByTagName("td")[5].innerHTML  =  Number(rows[i].getElementsByTagName("td")[1].firstChild.nodeValue)+ 
           Number(rows[i].getElementsByTagName("td")[2].firstChild.nodeValue)+
           Number(rows[i].getElementsByTagName("td")[3].firstChild.nodeValue)+ 
           Number(rows[i].getElementsByTagName("td")[4].firstChild.nodeValue);
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'OFSS' || 
           rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Site' ||
           rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Others'){            
           rows[i].getElementsByTagName("td")[5].innerHTML  = '';  
           rows[i].style.fontWeight = "BOLD";
       }   

       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Total' || 
           rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
           rows[i].style.fontWeight = "BOLD";   
           rows[i].style.color = "#016795";
       }          

       rows[i].getElementsByTagName("td")[5].style.fontWeight = "BOLD";   
   }
   
   
   /* ************************************************************************************************ *
    * Aging Summary
    * ************************************************************************************************ */
      
   var table = document.getElementById("ageSlabSummary");    
   var tbody = table.getElementsByTagName("tbody")[0];
   var rows = tbody.getElementsByTagName("tr");

   for (var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[1].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
           rows[i].getElementsByTagName("td")[1].innerHTML  = summaryTotaling;
           summaryTotaling = 0;
       }
   }   

   for (var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[2].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
           rows[i].getElementsByTagName("td")[2].innerHTML  = summaryTotaling;
           summaryTotaling = 0;
       }
   }

   for (var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[3].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
           rows[i].getElementsByTagName("td")[3].innerHTML  = summaryTotaling;
           summaryTotaling = 0;
       }
   }

   for (var i=1; i < rows.length; i++) {
       summaryTotaling = Number(summaryTotaling)+ Number(rows[i].getElementsByTagName("td")[4].firstChild.nodeValue);         
       if(rows[i].getElementsByTagName("td")[0].firstChild.nodeValue == 'Grand Total'){            
           rows[i].getElementsByTagName("td")[4].innerHTML  = summaryTotaling;
           summaryTotaling = 0;
       }
   }

   for (var i=1; i < rows.length; i++) {
       rows[i].getElementsByTagName("td")[5].innerHTML  =  Number(rows[i].getElementsByTagName("td")[1].firstChild.nodeValue)+ 
           Number(rows[i].getElementsByTagName("td")[2].firstChild.nodeValue)+
           Number(rows[i].getElementsByTagName("td")[3].firstChild.nodeValue)+ 
           Number(rows[i].getElementsByTagName("td")[4].firstChild.nodeValue);
       rows[i].getElementsByTagName("td")[5].style.fontWeight = "BOLD";
   }

   rows[rows.length-1].style.fontWeight = "BOLD";
   rows[rows.length-1].style.color = "#016795";

   
  
</script>
<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(D) Issues pending with OFSS</span>
<br clear="all" />
<br />

 <table id="issuesList_PENDING_WITH_OFSS_id" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="20" style="border:1px solid #000000;"><strong>Item No</strong></td>
                <td width="20" style="border:1px solid #000000;"><strong>Issue Reference</strong></td>
                <td width="300" style="border:1px solid #000000;"><strong>Issue Description</strong></td>
                <td width="75"  style="border:1px solid #000000;"><strong>Reported Date </strong></td>
                <td width="100" style="border:1px solid #000000;"><strong>Comments</strong></td>
            </tr>
            <s:iterator value="issuesList_PENDING_WITH_OFSS" status="itStatus">
                <tr style="text-align:center;">
                    <td width="20" style="border:1px solid #000000;"><s:property value="#itStatus.count" /></td>
                    <td width="20" style="border:1px solid #000000;"><s:property value="issueNo"/></td>
                    <td width="300" style="border:1px solid #000000; text-align: left;"><s:property value="queryDescription"/></td>
                    <td width="75" style="border:1px solid #000000;"><s:property value="dateReported"/></td>
                    <td width="100" style="border:1px solid #000000;"><s:property value="status"/></td>
                </tr>
            </s:iterator>    

        </table>


<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(E) Issues pending with Site</span>
<br clear="all" />
<br />

<table id="issuesList_PENDING_WITH_SITE_id" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="20" style="border:1px solid #000000;"><strong>Item No</strong></td>
                <td width="20" style="border:1px solid #000000;"><strong>Issue Reference</strong></td>
                <td width="300" style="border:1px solid #000000;"><strong>Issue Description</strong></td>
                <td width="75"  style="border:1px solid #000000;"><strong>Reported Date </strong></td>
                <td width="100" style="border:1px solid #000000;"><strong>Comments</strong></td>
            </tr>
            <s:iterator value="issuesList_PENDING_WITH_SITE" status="itStatus">
                <tr style="text-align:center;">
                    <td width="20" style="border:1px solid #000000;"><s:property value="#itStatus.count" /></td>
                    <td width="20" style="border:1px solid #000000;"><s:property value="issueNo"/></td>
                    <td width="300" style="border:1px solid #000000; text-align: left;"><s:property value="queryDescription"/></td>
                    <td width="75" style="border:1px solid #000000;"><s:property value="dateReported"/></td>
                    <td width="100" style="border:1px solid #000000;"><s:property value="status"/></td>
                </tr>
            </s:iterator>    

        </table>



<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(F) Issues Concluded in period</span>
<br clear="all" />
<br />

<table id="issuesList_CONCLUDED_IN_PERIOD_id" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="20" style="border:1px solid #000000;"><strong>Item No</strong></td>
                <td width="20" style="border:1px solid #000000;"><strong>Issue Reference</strong></td>
                <td width="300" style="border:1px solid #000000;"><strong>Issue Description</strong></td>
                <td width="75"  style="border:1px solid #000000;"><strong>Reported Date </strong></td>
                <td width="100" style="border:1px solid #000000;"><strong>Comments</strong></td>
            </tr>
            <s:iterator value="issuesList_CONCLUDED_IN_PERIOD" status="itStatus">
                <tr style="text-align:center;">
                    <td width="20" style="border:1px solid #000000;"><s:property value="#itStatus.count" /></td>
                    <td width="20" style="border:1px solid #000000;"><s:property value="issueNo"/></td>
                    <td width="300" style="border:1px solid #000000; text-align: left;"><s:property value="queryDescription"/></td>
                    <td width="75" style="border:1px solid #000000;"><s:property value="dateReported"/></td>
                    <td width="100" style="border:1px solid #000000;"><s:property value="status"/></td>
                </tr>
            </s:iterator>    

        </table>


<br />
<br clear="all" />
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">(G) Issues Reported in Period</span>
<br clear="all" />
<br />

<table id="issuesList_REPORTED_IN_PERIOD_id" style="border:1px solid #000000; font-family:Arial, Helvetica, sans-serif; font-size:12px; border-collapse: collapse;  width: 75%;">
            <tr style="background-color:#DBDBDB; text-align:center;">
                <td width="20" style="border:1px solid #000000;"><strong>Item No</strong></td>
                <td width="20" style="border:1px solid #000000;"><strong>Issue Reference</strong></td>
                <td width="300" style="border:1px solid #000000;"><strong>Issue Description</strong></td>
                <td width="75"  style="border:1px solid #000000;"><strong>Reported Date </strong></td>
                <td width="100" style="border:1px solid #000000;"><strong>Comments</strong></td>
            </tr>
            <s:iterator value="issuesList_REPORTED_IN_PERIOD" status="itStatus">
                <tr style="text-align:center;">
                    <td width="20" style="border:1px solid #000000;"><s:property value="#itStatus.count" /></td>
                    <td width="20" style="border:1px solid #000000;"><s:property value="issueNo"/></td>
                    <td width="300" style="border:1px solid #000000; text-align: left;"><s:property value="queryDescription"/></td>
                    <td width="75" style="border:1px solid #000000;"><s:property value="dateReported"/></td>
                    <td width="100" style="border:1px solid #000000;"><s:property value="status"/></td>
                </tr>
            </s:iterator>    

        </table>

<br/><br/><br/>


