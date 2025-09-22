import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';
import type { BlogDisplayRoute, BlogRoutes, Input } from '../types/Blog.types';

const BlogDisplay: BlogDisplayRoute[] = [
  {
    path: "/Blog/display/:id",
    title: "blog display",
    page: <DataDisplay
      pageName="blog display"
      url={"/api/blog/?id="}
    />,
  }
];

const Blog: BlogRoutes = [
  [
    {
      path: "/Blog",
      pageName: "Blog",
      title:"Blog",
      page: <Page_
        pageName={"Blog"}
        url={"/api/blog/"}
        deleteUrl="/api/blog/?id="
      />,
    },
    {
      path: "/Blog/create",
      pageName: "Blog",
      url: "/api/blog/",
      title: "eCommerce Dashboard | Blog Create",
      page: <Create
        pageName={"Blog"}
        url="/api/blog/"
        
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "date", name: "Date" },
          { type: "editer", name: "Content", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "text", name: "Author" },
          { type: "file", name: "Image" },
          { type: "date", name: "Created_At" }
        ]}
      />,
    },
    {
      path: "/Blog/update/:id",
      pageName: "Blog",
      url: "/api/blog/?id=",
      title: "eCommerce Dashboard | Blog Update", 
      page: <Update
        pageName="Blog"
        url="/api/blog/?id="
        getDataUrl="/api/blog/?get-for-update="
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "date", name: "Date" },
          { type: "editer", name: "Content", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "text", name: "Author" },
          { type: "file", name: "Image" },
            { type: "text", name: "Image", disabled:true },
          { type: "date", name: "Created_At" }
        ]}
      />,
    },
    ...BlogDisplay
  ],
];

export { Blog };