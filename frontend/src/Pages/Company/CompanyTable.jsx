export const CompanyTable = ({ company }) => (
  <div className='company-table'>
    {company.map(({ title, field }) => (
      <div className='content-container' key={field}>
        <p className='title'>{title} </p>
        <p>{field} </p>
      </div>
    ))}
  </div>
)
