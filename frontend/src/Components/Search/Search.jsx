import { useEffect } from 'react'
import { SearchCompany } from './SearchCompany'
import { SearchNoResults } from './SearchNoResults'
import { convertSearchData } from '../../Utils/convertSearchData'
import { filterCompanies } from '../../Utils/filterCompanies'
import { useSearchContext } from '../../Context/SearchContext'
import { SearchStatistic } from './SearchStatistic'
import { useFetch } from '../../Hooks/useFetch'
import { DEFAULT_API_ENDPOINT } from '../../Constants/Constants'

export const Search = () => {
  const {
    searchField,
    companies,
    setCompanies,
    isCompaniesFound,
    isSearchFieldEmpty,
  } = useSearchContext()
  const { apiData } = useFetch(DEFAULT_API_ENDPOINT)

  const isNoData = !apiData?.searchData

  /* eslint-disable react-hooks/exhaustive-deps */
  useEffect(() => {
    if (isNoData) return
    const allCompanies = apiData.searchData.companies
    setCompanies(filterCompanies(searchField, allCompanies))
  }, [searchField])

  if (!isCompaniesFound && !isSearchFieldEmpty) return <SearchNoResults />

  if (isCompaniesFound)
    return (
      <div>
        <SearchStatistic />
        {companies.map((company, index) => {
          const convertedData = convertSearchData({ ...company })
          return (
            <SearchCompany
              key={index}
              index={index}
              convertedData={convertedData}
            />
          )
        })}
      </div>
    )

  return
}
