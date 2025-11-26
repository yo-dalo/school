import React ,{useEffect,useState} from 'react'
import cimg from "../../images/cards/cards-01.png"
const TdImg = ({src}) => {
      const [img, setImg] = useState("");
  useEffect(()=>{
    setImg(src)
    
  },[src])
  
  return ( 
    <td className="border-b  border-[#eee] py-5 px-4 pl-5 dark:border-strokedark xl:pl-11">
                  <img src={img} className="font-medium max-w-40  scale-[1] text-black dark:text-white" />
                  
                  
                </td>
  )
}

export default TdImg