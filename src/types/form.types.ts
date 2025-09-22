import { ReactNode } from 'react';

export interface Template {
  code: string;
  name: string;
}

export interface BaseInput {
  type: string;
  name: string;
  disabled?: boolean;
}

export interface Option {
  value: string;
  label: string;
}

export interface TextInput extends BaseInput {
  type: 'text';
}

export interface NumberInput extends BaseInput {
  type: 'number';
}

export interface DateInput extends BaseInput {
  type: 'date';
}

export interface TextAreaInput extends BaseInput {
  type: 'text-area';
}

export interface EditorInput extends BaseInput {
  type: 'editer';
  tamplet: Template[];
}

export interface OptionInput extends BaseInput {
  type: 'option';
  optionBy: string;
  valueBy: string;
  url?: string;
  options?: Option[];
  toLink?: string;
}

export interface FileInput extends BaseInput {
  type: 'file';
  multiple?: boolean;
}

export interface MultiInput extends BaseInput {
  type: 'multiInputs';
  inputs: Array<FormInput>;
}

export type FormInput = 
  | TextInput 
  | NumberInput 
  | DateInput 
  | TextAreaInput 
  | EditorInput 
  | OptionInput 
  | FileInput 
  | MultiInput;

export interface CreateProps {
  url: string;
  inputs: FormInput[];
  pageName?: string;
  children?: ReactNode;
}

export interface ErrorType {
  index: number;
  newError: {
    error: boolean;
    message: string;
  };
}