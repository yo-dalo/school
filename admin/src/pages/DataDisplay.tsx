import TableTd from '../components/TablesX/TableTd';
import isImage from '../common/Helper/IsImage';
import IsHtml from '../common/Helper/IsHtml';
import parse from 'html-react-parser';
import React,{useEffect,useState,useRef} from "react";
import Axios from "axios"
import { Link ,useParams} from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import Yo from '../common/Helper/Yo.js';
const DataDisplay = ({url,deleteImgUrl="" ,pageName='-'}) => {
  
  const { id } = useParams();
  const go =   useNavigate()
 const  imgRef= useRef([])
  
 // refs.current = items.map((_, i) => refs.current[i] ?? null);
  
  
  const [updata, setUpdata] = useState(null);
  const [keyArryX, setKeyArryX] = useState([]);
    const [dataX, setDataX] = useState({});
    const [loading, setLoading] = useState(null);
    
  const user = {
    id: 1,
    name: "John Doe",
    email: "john@example.com",
    city: "New York",
  };
  
  
  
  
  
  
  
  
  

const deleteImg = async(id,index)=>{
 
// console.log(imgRef.current.style.display='none')
try {
 await Yo.delete(deleteImgUrl+id)
   imgRef.current[index].style.display='none'
  toast.success("delete img sucascfull")
} catch (error) {
  alert('err')
  toast.error(error)
}
}

  useEffect(() => {
  const source = Axios.CancelToken.source();
  setLoading(true);
  Axios.get(url+id, { cancelToken: source.token })
    .then((res) => {
      if (res.data.data ) {
        setKeyArryX(Object.keys(res.data.data));
        setDataX(res.data.data);
      } else {
      toast.error("No data found");
        
        setDataX([]);
      }
    })
    .catch((err) => {
      if (!Axios.isCancel(err)) {
        console.error("Error fetching data:", err);
         toast.error("Error fetching data:");

      }
    })
    .finally(() => {
      setLoading(false);
    });

  return () => {
    source.cancel("Component unmounted, request canceled.");
  };
}, [url]);







  return (
    <div  className="p-6 rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
      <h1 className="text-2xl font-bold mb-4">{pageName}</h1>
      <div className="overflow-x-auto ">
        <table className="min-w-full shadow-md rounded-lg overflow-hidden">
          <thead className="rounded-sm  border-stroke bg-gray-300 shadow-default  dark:bg-gray-600 sm:px-7.5 xl:pb-1">
            <tr>
              <th className="py-3 px-6 text-left">Field</th>
              <th className="py-3 px-6 text-left">Value</th>
            </tr>
          </thead>
          <tbody>
          
{keyArryX.map((data, index) => (
  <tr key={index} className="border-b">
    <td className="py-3 px-6 font-medium">{data}</td>

    {Array.isArray(dataX[data]) ? (
      <td className="py-3 flex max-w-[70vw] gap-3 overflow-scroll px-6">
        {dataX[data].map((item, i) => (
          <div key={i}>
            {typeof item.img === 'string' && isImage(item.img) ? (
              <div  ref={e=> imgRef.current[i] = e } className="flex flex-col gap-1.5 justify-between items-center">
              <img className="max-w-xl max-h-60" src={`/uploads/${item.img}`} alt="preview" />
                 <div onClick={()=>deleteImg(item.id,i)} className="bg-red-800 px-2 py-1">Delect{i} </div>
                 </div>
            ) : (
              <div>{item.id || "--"}</div>
            )}
          </div>
        ))}
      </td>
    ) : (
      <td className="py-3 px-6">
        {typeof dataX[data] === 'string' && isImage(dataX[data]) ? (
          <img className="max-w-xl max-h-60" src={`/uploads/${dataX[data]}`} alt="preview" />
        ) : (
              typeof dataX[data] === 'string' && IsHtml(dataX[data])
            ? parse(dataX[data])
            : (dataX[data] || "--")
        )}
      </td>
    )}
  </tr>
))}
          </tbody>
          
        </table>
      </div>
    </div>
  );
};

export default DataDisplay;