using System;
using System.ComponentModel.DataAnnotations;

namespace ExcelToDB.Models
{
    public class DoorBuilderDetails
    {
        [Key]
        public long Id { get; set; }
        public long Numerals { get; set; }
        public string Address { get; set; }
        public string PostCode { get; set; }

        public string Block { get; set; }
        public string Floor { get; set; }
        public double Width { get; set; }
        public double Height { get; set; } 
        public string FireRating { get; set; }
        public string FrameMaterial { get; set; } 
        public string DoorThickness { get; set; }
        public string FrameFinish { get; set; }
        public string RainDeflector { get; set; }
        public string DoorOpens { get; set; }
        public string HingedSide { get; set; }
        public string DoorStyle { get; set; } 
        public string ExternalColour { get; set; }
        public string InternalColour { get; set; }
        public string Chain { get; set; }
        public string LetterPlate { get; set; }
        public string DoorKnocker { get; set; }
        public string LockOptions { get; set; }
        public string Spyhole1200mm { get; set; }
        public string Spyhole1500mm { get; set; }
        public string ExternalHardwareFinish { get; set; }
        public string Closer { get; set; }
        public string Threshold { get; set; }
        public string Notes { get; set; }

    }
}
