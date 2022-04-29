using Microsoft.AspNetCore.Http;
namespace ExcelToDB.Services
{
    public interface IDoorBuilderDetailsService
    {
        public void UploadExcel(IFormFile formFile);
    }
}
