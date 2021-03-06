using System.Collections.Generic;
using System.Data;
using OfficeOpenXml;

namespace ExcelToDB.Helpers
{
    public static class WorksheetHelper
    {
        public static List<string> GetColNamesInExcelSheet(ExcelWorksheet ws, int lastCol)
        {
            List<string> colNames = new List<string>();
            for (int i = 1; i <= lastCol; i++)
            {
                var colData = ws.Cells[1, i].Value;
                colNames.Add(colData.ToString());
            }
            return colNames;
        }

        public static DataTable WorksheetToDT(ExcelWorksheet ws, List<string> colsRequired, int firstRow, int lastRow, int firstCol, int lastCol)
        {
            DataTable dt = new DataTable();
            for (int c = firstCol; c <= lastCol; c++)
            {
                dt.Columns.Add(ws.Cells[firstRow, c].Value.ToString());
            }

            for (int r = firstRow + 1; r <= lastRow; r++)
            {
                DataRow row = dt.Rows.Add();
                for (int c = firstCol; c <= lastCol; c++)
                {
                    var cellData = ws.Cells[r, c].Value;
                    row[c - 1] = cellData;
                }
            }
            return dt;
        }
    }
}
