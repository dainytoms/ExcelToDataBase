using System;

namespace ExcelToDB.CustomExceptions
{
    public class ValidationException : Exception
    {
        public ValidationException(string msg) : base(msg)
        {

        }
    }
}
