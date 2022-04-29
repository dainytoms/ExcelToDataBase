using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ExcelToDB.Services;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ExcelToDB.CustomExceptions;
using System;

namespace ExcelToDB.Controllers
{
    public class ExcelOpsController : Controller
    {

        public ILogger _logger;
        private IDoorBuilderDetailsService _service;

        public ExcelOpsController(ILogger<ExcelOpsController> logger, IDoorBuilderDetailsService service)
        {
            _logger = logger;
            _service = service;
        }

        [HttpPost("/api/UploadExcelFile"), DisableRequestSizeLimit]
        public async Task<IActionResult> UploadExcel( IFormFile formFile)
        {

            try
            {
                _service.UploadExcel(formFile);
                return Ok(new { results = "File Uploaded Successfully To Database" });
            }
            catch (ValidationException ve)
            {
                return Ok(new { results = ve.Message.ToString() });
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError);
            }

        }


       
    }
}
