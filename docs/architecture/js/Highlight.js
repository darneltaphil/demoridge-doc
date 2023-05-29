import React from "react";

export default Highlight = ({ children, bg, color }) => (
  <span
    style={{
      backgroundColor: bg,
      borderRadius: "2px",
      color: color,
      padding: "0.2rem",
      margin: "0.5rem",
    }}
  >
    {children}
  </span>
);
