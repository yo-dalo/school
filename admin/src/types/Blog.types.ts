import { ReactNode } from 'react';

interface Template {
  code: string;
  name: string;
}

interface BaseInput {
  type: string;
  name: string;
}

interface TextInput extends BaseInput {
  type: 'text';
  disabled?: boolean;
}

interface NumberInput extends BaseInput {
  type: 'number';
}

interface DateInput extends BaseInput {
  type: 'date';
}

interface FileInput extends BaseInput {
  type: 'file';
}

interface EditerInput extends BaseInput {
  type: 'editer';
  tamplet: Template[];
}

interface Option {
  value: string;
  label: string;
}

interface OptionInput extends BaseInput {
  type: 'option';
  optionBy: string;
  valueBy: string;
  options?: Option[];
  url?: string;
}

type Input = TextInput | NumberInput | DateInput | FileInput | EditerInput | OptionInput;

interface BlogRoute {
  path: string;
  pageName?: string;
  title?: string;
  url?: string;
  page: ReactNode;
}

interface BlogDisplayRoute extends BlogRoute {
  title: string;
}

type BlogRoutes = [BlogRoute[], ...BlogDisplayRoute[]];

export type {
  Template,
  Input,
  BlogRoute,
  BlogDisplayRoute,
  BlogRoutes
};