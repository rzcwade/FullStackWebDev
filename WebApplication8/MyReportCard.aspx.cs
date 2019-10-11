using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class MyReportCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            if (!IsPostBack)
                grid.StartEdit(2);
        }
        protected void chkMemoLocation_CheckedChanged(object sender, EventArgs e)
        {
            var layoutItem = FindNotesLayoutItem();
            if (chkMemoLocation.Checked)
            {
                layoutItem.VisibleIndex = 5;
                layoutItem.Width = Unit.Percentage(100);
            }
            else
            {
                layoutItem.VisibleIndex = 2;
                layoutItem.Width = Unit.Empty;
            }
        }
        DevExpress.Web.GridViewColumnLayoutItem FindNotesLayoutItem()
        {
            return grid.EditFormLayoutProperties.Items.OfType<DevExpress.Web.GridViewColumnLayoutItem>().First(item => item.ColumnName == "Notes");
        }
        protected void chkNewRowLocation_CheckedChanged(object sender, EventArgs e)
        {
            grid.SettingsEditing.NewItemRowPosition = chkNewRowLocation.Checked ? DevExpress.Web.GridViewNewItemRowPosition.Bottom : DevExpress.Web.GridViewNewItemRowPosition.Top;
        }
    }
}


