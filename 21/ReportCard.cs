//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _21
{
    using System;
    using System.Collections.Generic;
    
    public partial class ReportCard
    {
        public int ServiceNumber { get; set; }
        public Nullable<int> TimeWorkedInHours { get; set; }
        public int MonthNumber { get; set; }
        public int Year { get; set; }
    
        public virtual DirectoryOfEmployee DirectoryOfEmployee { get; set; }
    }
}
