import React from 'react'

const TableTh = ({text,className}) => {
  return (
    <th className={`${className} py-4 px-4 font-medium text-black dark:text-white xl:pl-11`}>
                {text}
      </th>
  )
}

export default TableTh