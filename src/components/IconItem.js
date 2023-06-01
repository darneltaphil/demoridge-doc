import { faXmarkCircle } from "@fortawesome/free-regular-svg-icons";
import {
  faPhp,
  faExpeditedssl,
  faFontAwesome,
  faJs,
} from "@fortawesome/free-brands-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import PropTypes from "prop-types";
import React from "react";
function IconItem({ label, icon, size, color }) {
  return (
    <span style={{ display: "table-row" }}>
      <span style={{ width: "4em", display: "table-cell" }}>
        <FontAwesomeIcon
          icon={icon}
          size={size}
          color={color}
          style={{ verticalAlign: "middle", paddingRight: "1rem" }}
        />
      </span>
      <span>{label}</span>
    </span>
  );
}

IconItem.propTypes = {
  label: PropTypes.string,
  icon: PropTypes.string,
  size: PropTypes.string,
};
// Specifies the default values for props:
IconItem.defaultProps = {
  label: "",
  icon: faXmarkCircle,
  size: "1x",
};

export default IconItem;
