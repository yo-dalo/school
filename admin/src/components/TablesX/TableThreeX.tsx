import TdImg from './TdImg';
import TebletAction from './TebletAction';
import TableTd from './TableTd';
import TableTh from './TableTh';
import { useEffect, useState } from 'react';
import Axios from "axios";
import { Link, useParams, useLocation } from 'react-router-dom';
import isImage from "../../common/Helper/IsImage";
import { toast } from 'react-toastify';
import Pagination from '../Pagination';


interface TableData {
  [key: string]: any;
  id?: number | string;
}

interface TableThreeXProps {
  url: string;
}

const TableThreeX = ({ url,deleteUrl, }: TableThreeXProps) => {
  const { search } = useLocation();
  const queryParams = new URLSearchParams(search);
  const pageNumber = queryParams.get('page') || '1';
  const { id } = useParams();
  
  const [updata, setUpdata] = useState<number | string | null>(null);
  const [keyArryX, setKeyArryX] = useState<string[]>([]);
  const [dataX, setDataX] = useState<TableData[]>([]);
  const [loading, setLoading] = useState<boolean>(false);
  const [paginationData, setPaginationData] = useState<any>({});

  useEffect(() => {
    const source = Axios.CancelToken.source();
    
    setLoading(true);
    Axios.get(`${url}?page=${pageNumber}`, { cancelToken: source.token })
      .then((res) => {
        if (res.data?.data?.data?.length > 0) {
          setKeyArryX(Object.keys(res?.data.data?.data[0]));
          setDataX(res?.data?.data?.data);
          setPaginationData(res?.data?.data?.pagination || null);
          console.log(res?.data?.data?.pagination);
        } else {
         // toast.error("No data found");
          setDataX([]);
        }
      })
      .catch((err) => {
        if (!Axios.isCancel(err)) {
          toast.error("An error occurred while fetching data. Please try again.");
        }
      })
      .finally(() => {
        setLoading(false);
      });

    return () => {
      source.cancel("Component unmounted, request canceled.");
    };
  }, [url, updata, pageNumber]);

  const deleteItem = (id: number | string) => {
    Axios.delete(`${deleteUrl}${id}`)
      .then(() => {
        setUpdata(id);
        toast.success("Item deleted successfully");
      })
      .catch(() => {
        toast.error("Failed to delete item");
      });
  };

  if (loading) {
    return (
      <div className="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
        <div className="flex justify-center items-center h-32">
          Loading...
        </div>
      </div>
    );
  }

  return (
    <>
    <div className="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
      <div className="max-w-full overflow-x-auto">
        <table className="w-full table-auto">
          <thead>
            <tr className="bg-gray-2 text-left dark:bg-meta-4">
              <TableTh className="min-w-[20px]" text="#" />
              {keyArryX.map((key) => (
                <TableTh key={`th-${key}`} className="min-w-[20px]" text={key} />
              ))}
              <th className="py-4 px-4 font-medium text-black dark:text-white">
                Actions
              </th>
            </tr>
          </thead>
          <tbody>
            {dataX.length > 0 ? (
              dataX.map((packageItem) => (
                <tr key={`row-${packageItem.id || packageItem.Id || packageItem.name}`}>
                  <TableTd text_1={(Number(pageNumber) - 1) * 10 + (dataX.indexOf(packageItem) + 1)} />
                  {keyArryX.map((element) => (
                    typeof packageItem[element] === 'string' && isImage(packageItem[element]) ? (
                      <TdImg 
                        key={`img-${packageItem.id || packageItem.Id}-${element}`}
                        src={`/uploads/${packageItem[element]}` || "default-image.png"} 
                      />
                    ) : (
                      <TableTd 
                        key={`td-${packageItem.id||packageItem.Id}-${element}`}
                        text_1={packageItem[element] || '-'} 
                      />
                    )
                  ))}
                  <TebletAction 
                    more_info_url={`display/${packageItem.id || packageItem.Id}`}
                    delete_url={() => deleteItem(packageItem.id || packageItem.Id)} 
                    update_url={`update/${packageItem.id || packageItem.Id }`} 
                  />
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={keyArryX.length + 2} className="py-4  whitespace-nowrap flex text-red-500 ">
                  No data found .............
                  
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>

 <Pagination url={url} data={paginationData} />

</>



  );
};

export default TableThreeX;