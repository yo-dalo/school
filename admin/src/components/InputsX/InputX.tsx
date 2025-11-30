import InputTextArea from './InputTextArea';
import InputNumber from './InputNumber';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import SelectInput from './SelectInput';
import FileInput from './FileInput';
import Input from './Input';

interface InputElement {
  type: 'text' | 'number' | 'text-area' | 'option' | 'file' | 'multiInputs';
  name: string;
  valueBy?: string;
  optionBy?: string;
  url?: string;
  toLink?: string;
  multiple?: boolean;
  inputs?: InputElement[];
}

interface InputXProps {
  inputs: InputElement[];
  name?: string;
  get: (data: any) => void;
  value?: Record<string, any>;
}

const InputX = ({ inputs, name, get, value = {} }: InputXProps) => {
  const [allData, setAllData] = useState<Record<string, any>>({});
  const [loading, setLoading] = useState(false);

  const handleChange = (key: string, value: any) => {
    setAllData(prev => ({ ...prev, [key]: value }));
  };

  useEffect(() => {
    if (value && Object.keys(value).length > 0) {
      setAllData(prev => ({ ...prev, ...value }));
    }
  }, [value]);

  useEffect(() => {
    get(allData);
  }, [allData]);

  const renderInput = (element: InputElement, index: number) => {
    // Create a unique key based on element name and index
    const uniqueKey = `${element.name}-${index}`;
    
    const commonProps = {
      key: uniqueKey, // Make sure key is passed properly
      label: element.name,
      value: allData[element.name] || '',
      disabled: false,
      onChange: (e: React.ChangeEvent<HTMLInputElement>) => handleChange(element.name, e.target.value)
    };

    switch (element.type) {
      case 'text':
        return <Input {...commonProps} placeholder="Enter value" />;
      case 'number':
        return <InputNumber {...commonProps} placeholder="Enter value" />;
      case 'text-area':
        return <InputTextArea {...commonProps} placeholder="Enter value" />;
      case 'option':
        return (
          <SelectInput
            key={uniqueKey}
            setSelecter={handleChange}
            optionValue={element.valueBy || 'value'}
            name={element.name}
            optionShowBy={element.optionBy || 'label'}
            url={element.url || ''}
            selectedValue={allData[element.name] || ''}
            toLink={{ [element.toLink || '']: allData[element.toLink || ''] } || {}}
            error={[]}
          />
        );
      case 'file':
        return (
          <FileInput
            key={uniqueKey}
            label={element.name}
            value={allData[element.name] || ''}
            disabled={false}
            onChange={(e: React.ChangeEvent<HTMLInputElement>) => {
              if (e.target.files && e.target.files.length > 0) {
                handleChange(
                  element.name,
                  element.multiple ? Array.from(e.target.files) : e.target.files[0]
                );
              }
            }}
            multiple={element.multiple || false}
          />
        );
      case 'multiInputs':
        return (
          <MultiInput
            key={uniqueKey}
            inputs={element.inputs || []}
            get={(data) => handleChange(element.name, data)}
          />
        );
      default:
        return <div key={uniqueKey}>Unsupported input type</div>;
    }
  };

  return (
    <div className="rounded-sm min-w-full border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
      {name && <div className="p-3">{name}</div>}
      <div className="p-6.5">
        <div className="mb-4.5 flex flex-col gap-6 md:flex-row md:flex-wrap2 xl:flex-row">
          {inputs?.map((element, index) => renderInput(element, index))}
        </div>
      </div>
    </div>
  );
};

export default InputX;