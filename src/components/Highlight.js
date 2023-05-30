import React from "react";

export default function Highlight({ children, bg, color }) {
  return (
    <span
      style={{
        backgroundColor: bg,
        borderRadius: "2px",
        color: color,
        padding: "0.2rem",
        margin: "0.5rem",
        display: "inline",
      }}
    >
      {children}
    </span>
  );
}
