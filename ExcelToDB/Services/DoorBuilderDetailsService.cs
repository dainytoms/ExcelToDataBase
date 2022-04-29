using ExcelToDB.CustomExceptions;
using ExcelToDB.Helpers;
using ExcelToDB.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using OfficeOpenXml;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ExcelToDB.Services
{
    public class DoorBuilderDetailsService : IDoorBuilderDetailsService
    {
        private readonly DoorBuilderDBContext DoorBuilderDBContext;

        public int firstCol = 0;
        public int firstRow = 0;

        public int lastCol = 0;
        public int lastRow = 0;
        List<string> colsRequired = new List<string>(new string[] {

            "Numeral",
            "Address",
            "Post Code",
            "Block",
            "Floor",
            "Location",
            "Width",
            "Height",
            "Fire Rating",
            "Frame Material",
            "Door Thickness",
            "Frame Finish",
            "Rain Deflector",
            "Door Opens",
            "Hinged Side (as viewed from outside)",
            "Door Style",
            "External Colour",
            "Internal Colour",
            "Chain",
            "Letter Plate",
            "Door Knocker",
            "Lock Options",
            "Spyhole @ 1200mm",
            "Spyhole @ 1500mm",
            "External Hardware Finish",
            "Closer",
            "Threshold",
            "Notes"

        });

        private readonly string _config;

        public DoorBuilderDetailsService(DoorBuilderDBContext bctxt, IConfiguration config)
        {
            DoorBuilderDBContext = bctxt;
            _config = config.GetConnectionString("AppConnectionString");
        }

        public void UploadExcel(IFormFile formFile)
        {
            string[] fileNamePath = formFile.FileName.Split('.');

            if (fileNamePath[fileNamePath.Length - 1] != "xls" && fileNamePath[fileNamePath.Length - 1] != "xlsx")
                throw new ValidationException("Please send an excel file to upload");

            var ms = new MemoryStream();
            formFile.CopyTo(ms);

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;


            using (ExcelPackage package = new ExcelPackage(ms))
            {
                ExcelWorksheet sheet = package.Workbook.Worksheets[0];

                var start = sheet.Dimension.Start;
                var end = sheet.Dimension.End;

                firstCol = start.Column;
                firstRow = start.Row;

                lastCol = end.Column;
                lastRow = end.Row;

                ValidateColumnNames(sheet);

                SaveToDB(sheet);
            }
        }

        public void ValidateColumnNames(ExcelWorksheet ws)
        {

            List<string> colNames = WorksheetHelper.GetColNamesInExcelSheet(ws, lastCol);
            foreach (var col in colsRequired)
            {
                if (!colNames.Contains(col))
                {
                    throw new ValidationException("Column name " + col + " doesn't exist in the excel file");
                }
            }

        }


        public void SaveToDB(ExcelWorksheet ws)
        {

            DataTable dt = WorksheetHelper.WorksheetToDT(ws, colsRequired, firstRow, lastRow, firstCol, lastCol);

            using (SqlConnection con = new SqlConnection(_config))
            {
                //Insert the Data read from the Excel file to Database Table.

                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name.
                    sqlBulkCopy.DestinationTableName = "dbo.DoorBuilderDetails";

                    //[OPTIONAL]: Map the Excel columns with that of the database table.

                    sqlBulkCopy.ColumnMappings.Add("Numeral", "Numerals");
                    sqlBulkCopy.ColumnMappings.Add("Address", "Address");
                    sqlBulkCopy.ColumnMappings.Add("Post Code", "PostCode");
                    sqlBulkCopy.ColumnMappings.Add("Block", "Block");
                    sqlBulkCopy.ColumnMappings.Add("Floor", "Floor");
                    sqlBulkCopy.ColumnMappings.Add("Location", "Location");
                    sqlBulkCopy.ColumnMappings.Add("Width", "Width");
                    sqlBulkCopy.ColumnMappings.Add("Height", "Height");
                    sqlBulkCopy.ColumnMappings.Add("Fire Rating", "FireRating");
                    sqlBulkCopy.ColumnMappings.Add("Frame Material", "FrameMaterial");
                    sqlBulkCopy.ColumnMappings.Add("Door Thickness", "DoorThickness");
                    sqlBulkCopy.ColumnMappings.Add("Frame Finish", "FrameFinish");
                    sqlBulkCopy.ColumnMappings.Add("Rain Deflector", "RainDeflector");
                    sqlBulkCopy.ColumnMappings.Add("Door Opens", "DoorOpens");
                    sqlBulkCopy.ColumnMappings.Add("Hinged Side (as viewed from outside)", "HingedSide");
                    sqlBulkCopy.ColumnMappings.Add("Door Style", "DoorStyle");
                    sqlBulkCopy.ColumnMappings.Add("External Colour", "ExternalColour");
                    sqlBulkCopy.ColumnMappings.Add("Internal Colour", "InternalColour");
                    sqlBulkCopy.ColumnMappings.Add("Chain", "Chain");
                    sqlBulkCopy.ColumnMappings.Add("Letter Plate", "LetterPlate");
                    sqlBulkCopy.ColumnMappings.Add("Door Knocker", "DoorKnocker");
                    sqlBulkCopy.ColumnMappings.Add("Lock Options", "LockOptions");
                    sqlBulkCopy.ColumnMappings.Add("Spyhole @ 1200mm", "Spyhole1200mm");
                    sqlBulkCopy.ColumnMappings.Add("Spyhole @ 1500mm", "Spyhole1500mm");
                    sqlBulkCopy.ColumnMappings.Add("External Hardware Finish", "ExternalHardwareFinish");
                    sqlBulkCopy.ColumnMappings.Add("Closer", "Closer");
                    sqlBulkCopy.ColumnMappings.Add("Threshold", "Threshold");
                    sqlBulkCopy.ColumnMappings.Add("Notes", "Notes");

                    con.Open();
                    sqlBulkCopy.WriteToServer(dt);
                    con.Close();
                }

                //using (SqlCommand command = new SqlCommand())
                //{
                //    command.Connection = conn;

                //    command.CommandText = "SP_BulkInsertBrandChannel";
                //    command.Parameters.Add("@brandchannel", SqlDbType.Structured);
                //    command.Parameters["@brandchannel"].TypeName = "UDT_BrandChannels";

                //    command.CommandType = CommandType.StoredProcedure;
                //    command.Parameters["@brandchannel"].Value = manipulatedDt;

                //    conn.Open();
                //    command.ExecuteNonQuery();
                //    conn.Close();

                //}
            }
        }

    }

}
