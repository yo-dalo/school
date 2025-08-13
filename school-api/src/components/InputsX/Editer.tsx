
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

import React,{useState,useEffect} from 'react'

const Editer = ({label,placeholder,disabled,value,onChange,ignore=[],className,tamplet=[]}) => {
  const [complement, setComplement] = useState([]);
  const [name, setName] = useState([label]);

const [editorData, setEditorData] = useState('');
  
  
  
    
    
    
  useEffect(() => {
    
    
      setEditorData(value)
  
  
    }, [value])
  useEffect(() => {
    
    setEditorData(value);
    console.log(value)
    
    
    const findComplement = () => {
    const result = name.filter((x) => !ignore.includes(x));
    
    setComplement(result);
  };
  findComplement()
  
  
    }, [label])

  
  
  return (
    <>
   {complement?.map((ignoreEle,i)=>(
                  <div key={i} className={`w-full xl:w-full md:w-[100%] ${className}`}>
                    <label className="mb-2.5 block text-black dark:text-white">
                      {label?.split("_")?.join(" ")} <span className="text-meta-1">{disabled?"Not For Edit":""}</span> 
                    </label>
                    
      <CKEditor
        editor={ClassicEditor}
        data={editorData}
        onChange={(event, editor) => {
          const data = editor.getData();
          const e = {target:{value:data}}
          console.log(tamplet[0].name)
          onChange(e)
        //  setEditorData(data)
          
        }}
      />
      
          <div className="flex pt-3 gap-1 text-white overflow-scroll">
      {tamplet?.map((element,i)=>(
        <div onClick={()=>{(editorData=="")?setEditorData(element.code): 5}} className="px-4 py-2 inline-flex rounded-bl  bg-purple-400" key={i}>{element?.name}</div>
        ))}
        </div>
     
                  </div>
  
      
      
        
          ))}
  </>
  )
}

export default Editer










