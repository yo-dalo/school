
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
        config={{
          ui: {
            viewportOffset: { top: 10, right: 10, bottom: 10, left: 10 }
          }
        }}
        onReady={(editor) => {
          // Add dark mode styles when editor is ready
          const editorElement = editor.ui.view.element;
          editorElement.style.backgroundColor = 'rgb(33, 33, 33)';
          editorElement.style.color = 'white';
          // Add dark mode styles to editor content
          editor.editing.view.change(writer => {
            writer.setStyle('background-color', 'rgb(33, 33, 33)', editor.editing.view.document.getRoot());
            writer.setStyle('color', 'white', editor.editing.view.document.getRoot());
          });
        }}
        onChange={(event, editor) => {
          const data = editor.getData();
          const e = {target:{value:data}}
          console.log(tamplet[0].name)
          onChange(e)
        }}
            />
      
          <div className="flex pt-3 gap-1  dark:border-strokedark text-white ">
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










