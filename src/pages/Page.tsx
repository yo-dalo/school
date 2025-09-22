
import Breadcrumb from '../components/Breadcrumbs/Breadcrumb';
import TableThreeX from '../components/TablesX/TableThreeX';
import Pagination from '../components/Pagination';
import React from 'react'
import { Link } from 'react-router-dom';

const Page = ({url,deleteUrl,pageName}) => {
  
  return (
    <>
    <Breadcrumb pageName={pageName}   />


      <div className="flex flex-col gap-10">
     <TableThreeX url={url} deleteUrl={deleteUrl} />
     {/* <Pagination url={url}  /> */}
     
      </div>
    </>
  );
};

export default Page