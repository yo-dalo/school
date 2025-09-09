import React from 'react'

const TableTd = ({text_1}) => {
  return (
                <td className="border-b  border-[#eee] py-5 px-4 pl-5 dark:border-strokedark xl:pl-11">
                  <h5 className="font-medium max-h-14  p-3 text-black dark:text-white">
                    {text_1}
                  </h5>
                </td>
  )
}

export default TableTd