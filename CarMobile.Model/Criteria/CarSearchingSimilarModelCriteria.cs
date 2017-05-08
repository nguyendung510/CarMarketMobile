using TQQ.Data.Repository;

namespace CarMobile.Model.Criteria
{
    public class CarSearchingSimilarModelCriteria : CriteriaBase
    {
        public int CarId { get; set; }

        public string Model { get; set; }

        public int CurrentPageIndex { get; set; }

        public int ItemsPerPage { get; set; }

        public override string GetSettingKey()
        {
            return "get_Similar_Model_Cars";
        }
    }
}
