



function isHtml(str) {
  if (typeof str !== 'string') return false;
  return /<\/?[a-z][\s\S]*>/i.test(str);
}


export default isHtml