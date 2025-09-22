import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import type { BlogDisplayRoute, BlogRoutes } from '../types/Blog.types';

const GalleryCategoryDisplay: BlogDisplayRoute[] = [
  {
    path: "/Gallery_Category/display/:id",
    title: "Gallery Category display",
    page: <DataDisplay
      pageName="Gallery Category display"
      url={"/api/gallery_category/##"}
    />,
  }
];

const GalleryCategory: BlogRoutes = [
  [
    {
      path: "/Gallery_Category",
      pageName: "Gallery_Category",
      title:"Gallery_Category",
      page: <Page_
        pageName={"Gallery_Category"}
        url={"/api/gallery_category/"}
        deleteUrl={"/api/gallery_category/?id="}
      />,
    },
    {
      path: "/Gallery_Category/create",
      pageName: "Gallery_Category",
      url: "/api/gallery_category/",
      title: "eCommerce Dashboard | Gallery Category Create",
      page: <Create
        pageName={"Gallery_Category"}
        url="/api/gallery_category/"
        
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "date", name: "Date" },
          { type: "option", name: "Is_Active", optionBy: "value", valueBy: "label", options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    {
      path: "/Gallery_Category/update/:id",
      pageName: "Gallery_Category",
      url: "/api/gallery_category/?id=",
      title: "eCommerce Dashboard | Gallery Category Update",
      page: <Update
        pageName="Gallery_Category"
        url="/api/gallery_category/?id="
        getDataUrl="/api/gallery_category/?get-for-update="
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "date", name: "Date" },
          { type: "option", name: "Is_Active", optionBy: "value", valueBy: "label", options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    ...GalleryCategoryDisplay
  ],
];

export { GalleryCategory };