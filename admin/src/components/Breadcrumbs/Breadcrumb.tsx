import { Link } from 'react-router-dom';

interface BreadcrumbLink {
  link: string;
  to: string;
}

interface BreadcrumbProps {
  pageName: string;
  links?: BreadcrumbLink[];
}

const Breadcrumb = ({ pageName, links = [] }: BreadcrumbProps) => {
  const hasLinks = links.length > 0;
  const showPageName = !hasLinks || pageName !== links[links.length - 1]?.link;

  return (
    <div className="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
      <Link to="create" className="text-title-md2 font-semibold text-black dark:text-white">
        {pageName}
      </Link>

      <nav>
        <ol className="flex items-center gap-2">
          {/* Dashboard link */}
          <li className="flex items-center">
            <Link className="font-medium" to="/">
              Dashboard
            </Link>
            {(hasLinks || showPageName) && <span className="mx-2">/</span>}
          </li>

          {/* Breadcrumb links */}
          {links.map((link, index) => (
            <li key={index} className="flex items-center">
              <Link  className="font-medium text-primary" to={link.to}>
                {link.link}
              </Link>
              {(index < links.length - 1 || showPageName) && <span className="mx-2">/</span>}
            </li>
          ))}

          {/* Current page */}
          {showPageName && (
            <li className="font-medium text-primary">
              {pageName}
            </li>
          )}
        </ol>
      </nav>
    </div>
  );
};

export default Breadcrumb;