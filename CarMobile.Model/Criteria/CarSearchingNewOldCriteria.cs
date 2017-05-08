using TQQ.Data.Repository;

namespace CarMobile.Model.Criteria
{
    public class CarSearchingNewOldCriteria : CriteriaBase
    {
        public short IsNew { get; set; }

        public int CurrentPageIndex { get; set; }

        public int ItemsPerPage { get; set; }

        /// <summary>
        /// Gets Setting Key.
        /// </summary>
        /// <returns>Setting key of the criteria.</returns>
        public override string GetSettingKey()
        {
            return "get_New_Old_Cars";
        }
    }
}