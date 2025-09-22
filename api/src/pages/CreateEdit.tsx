import FileInput from '../../components/Edit/FileInput';
import SelectInput from '../../components/Edit/SelectInput';
import Input from '../../components/Edit/Input';
import Breadcrumb from '../../components/Breadcrumbs/Breadcrumb';
import React,{useState,useEffect} from 'react'
import { useNavigate } from 'react-router-dom';
import axios from "axios"
import { Link ,useParams} from 'react-router-dom';


const CreateEdit = ({type,pageName,name,ignore,selecter,file,addUrl,editUrl,url}) => {
  const { id } = useParams();
  const go =   useNavigate()
  
  
  const [inputData, setInputData] = useState({})
  const [selecterData, setSelecterData] = useState({})
  const [imgFileData, setImgFileData] = useState({})
  
 const  getImg = (key,value)=>{
   setImgFileData({...imgFileData,[key]:value});
   
 }
 const  getSelcter = (key,value)=>{
   setSelecterData({...selecterData,[key]:value});
   
 }
 const  getinput = (key,value)=>{
   setInputData({...inputData,[key]:value});
   
 }
  
  
  
  
  
       const [obj, setObj] = useState({})
       const [objKey, setObjKey] = useState({})
       const [loding, setLoding] = useState(false)
       const [files, setFiles] = useState(null)
  
  
       useEffect(() => {
         console.log(selecter);
         
         axios.get(type=="edit"?url+id:url+1).then((res)=>{
          if(type=="edit"){
            setObj(res.data.data)
          }else{
            setObj({})
          }
           setObjKey(res.data.data)

         }).catch((err)=>{
           alert("err")
         })
         
       }, [setLoding])
       
      const changeValue = (e,key)=>{
    setObj({...obj, [key]: e.target.value})
  }
  
 const  edit=(e)=>{
   
   alert("edit")
      alert(JSON.stringify({...obj,...selecterData}))
   e.preventDefault();
   setLoding(true)
   axios.put(editUrl+id,{...obj,...selecterData,...imgFileData,} ).then((res)=>{
     setLoding(false)
     
   }).catch((e)=>{
     alert("err")
     setLoding(false)
   })
 }
 const  edit_v2=(e)=>{
   alert("edit_v2")
   const data_ ={...obj,...selecterData,...imgFileData,}
 alert(JSON.stringify({data_}))
   const formData = new FormData();
    Object.keys(data_).map((ele,i)=>{
    formData.append(ele, data_[ele]);
    })
 
         //alert(JSON.stringify({formData}))

   
   e.preventDefault();
   setLoding(true)
   axios.put(editUrl+id,formData,
   
      {
     headers: {
          "Content-Type": "multipart/form-data",
        },
   }
   
   ).then((res)=>{
     setLoding(false)
     
   }).catch((e)=>{
     alert("err")
     setLoding(false)
   })
 }
 const  create=(e)=>{
   alert("creact")
   alert(JSON.stringify({...selecterData,...imgFileData,...obj}))
   
   e.preventDefault();
   setLoding(true)
   axios.post(addUrl,{...selecterData,...imgFileData,...obj}
   ).then((res)=>{
     setLoding(false)
     
   }).catch((e)=>{
     
        alert(JSON.stringify({err:err}))

     setLoding(false)
   })
 }
 const  create_v2=(e)=>{
   alert("Create_2")
   const data_ ={...obj,...selecterData,...imgFileData,}
 alert(JSON.stringify({data_}))
   const formData = new FormData();
    Object.keys(data_).map((ele,i)=>{
    formData.append(ele, data_[ele]);
    })
         //alert(JSON.stringify({formData}))
   
   e.preventDefault();
   setLoding(true)
   axios.post(addUrl,formData,
   
      {
     headers: {
          "Content-Type": "multipart/form-data",
        },
   }
   
   ).then((res)=>{
     setLoding(false)
     
   }).catch((e)=>{
     alert("err")
     setLoding(false)
   })
 }
      
     return (
    <>
      <Breadcrumb pageName={pageName?pageName:"Form Layout"}  />


      <div className="grid grid-cols-1 gap-9 sm:grid-cols-2">
        <div className="flex flex-col gap-9">
          {/* <!-- Contact Form --> */}
          <div className="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
            <div className="border-b border-stroke py-4 px-6.5 dark:border-strokedark">
              <h3 className="font-medium text-black dark:text-white">
               Edit {name?name:""}
              </h3>
            </div>
            {/*type=='edit'?edit:files===true?edit_v2 :files?create_v2:create */}
            <form onSubmit={type == "edit"
    ? (file ? edit_v2 : edit)
    : (file ? create_v2 : create)}>
            
              <div className="p-6.5">
              


                <div className="mb-4.5 flex flex-col gap-6 xl:flex-row">

                              
              {Object.keys(objKey).map((ele, i) => (
  <React.Fragment key={i}>
    {/* Render SelectInput if index is 2 */}
    {i === 0 && selecter?.map((element, index) => (
      <SelectInput
        key={index}
        setSelecter={getSelcter}
        optionValue={element.optionValue}
        label={element.label}
        optionShowBy={element.optionShowBy}
        url={element.url}
        selectedValue={type==="edit"?obj[element.label]:''}
      />
    ))}

    {/* Render Input for each key in objKey */}
    <Input
      label={ele}
      value={obj[ele]}
      ignore={ignore}
      setValue={(e) => changeValue(e, ele)}
      disabled={ele === "id"}
      placeholder={`Enter your ${ele}`}
    />

    {/* Render FileInput if index is 2 */}
    {i === 2 && file?.map((element, index) => (
      <FileInput
        key={index}
        label={element.label}
        setFiles={getImg}
      />
    ))}
  </React.Fragment>
))}
                </div>
                
                
                <button type="submit" className="flex w-full justify-center rounded bg-primary p-3 font-medium text-gray hover:bg-opacity-90">
                  {type=='edit'?"Edit":"Create"} {pageName}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>

    </>
  );
}

export default CreateEdit