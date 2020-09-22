using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Invoicing_Application.Service
{
    public class clsSalesDetails
    {
        public string ProductID { get; set; }
        public string QTY { get; set; }
        public string Rate { get; set; }

        public string Total { get; set; }

        public string InvID { get; set; }

        public string HSN_NO { get; set; }

        public string SKU_Code { get; set; }



    }
}