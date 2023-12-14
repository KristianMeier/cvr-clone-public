import { createContext, useContext, useState } from 'react'

const SearchContext = createContext()

export const SearchContextProvider = ({ children }) => {
  const [companies, setCompanies] = useState([])
  const [searchField, setSearchField] = useState('')

  const isSearchFieldEmpty = searchField === ''
  const isCompaniesFound = !!companies.length

  return (
    <SearchContext.Provider
      value={{
        companies,
        setCompanies,
        searchField,
        setSearchField,
        isSearchFieldEmpty,
        isCompaniesFound,
      }}>
      {children}
    </SearchContext.Provider>
  )
}

export const useSearchContext = () => useContext(SearchContext)
