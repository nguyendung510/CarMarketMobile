using CarMobile.Framework;
using CarMobile.Framework.Cache;
using System;
using System.Collections.Generic;
using TQQ.Data;
using TQQ.Data.Repository;

namespace CarMobile.Service
{
    public class CarService
    {
        public IEnumerable<T> SearchingCarsForYou<T>(CriteriaBase criteria, bool isGetFromCache = false)
        {
            var cacheKey = string.Empty;
            ICache cache = null;
            IEnumerable<T> cars = null;

            try
            {
                var param = criteria.GetSpParams();

                if (isGetFromCache)
                {
                    cache = CacheManager.GetInstance();
                    cacheKey = criteria.GetSettingKey() + "SearchingCarsForYou";
                    cars = cache.GetCache<IEnumerable<T>>(cacheKey);
                }

                if (cars == null)
                {
                    using (ObjectDb obj = new ObjectDb(criteria.GetSettingKey()))
                    {
                        cars = obj.Query<T>(param);

                        if (isGetFromCache && cache != null)
                        {
                            cache.SetCache(cacheKey, cars);
                        }
                    }
                }

                return cars ?? new List<T>();
            }
            catch (Exception ex)
            {
                LogService.Error("SearchingCarsForYou - " + ex.Message, ex);
                return new List<T>();
            }
        }

        public IEnumerable<T> SearchingCars<T>(CriteriaBase criteria, bool isGetFromCache = false)
        {
            var carId = string.Empty;
            var cacheKey = string.Empty;
            ICache cache = null;
            IEnumerable<T> cars = null;

            try
            {
                var param = criteria.GetSpParams();
                if (param["carid"] != null)
                {
                    carId = param["carid"].ToString();
                }

                if (isGetFromCache && !string.IsNullOrEmpty(carId))
                {
                    cache = CacheManager.GetInstance();
                    cacheKey = criteria.GetSettingKey() + carId;
                    cars = cache.GetCache<IEnumerable<T>>(cacheKey);
                }

                if (cars == null)
                {
                    using (ObjectDb obj = new ObjectDb(criteria.GetSettingKey()))
                    {
                        cars = obj.Query<T>(param);

                        if (isGetFromCache && cache != null)
                        {
                            cache.SetCache(cacheKey, cars);
                        }
                    }
                }

                return cars ?? new List<T>();
            }
            catch (Exception ex)
            {
                LogService.Error("SearchingCars - " + ex.Message, ex);
                return new List<T>();
            }
        }
    }
}
