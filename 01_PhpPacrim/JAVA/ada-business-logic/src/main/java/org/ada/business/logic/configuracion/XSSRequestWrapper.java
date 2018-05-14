package org.ada.business.logic.configuracion;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.IOUtils;

public class XSSRequestWrapper extends HttpServletRequestWrapper{

	private byte[] rawData;
	private HttpServletRequest request;
	private ResettableServletInputStream servletStream;
  private final Map<String, String[]> modifiableParameters;
  private Map<String, String[]> allParameters = null;

	public XSSRequestWrapper(HttpServletRequest request, Map<String, String[]> additionalParams) {
		super(request);
		this.request = request;
		this.servletStream = new ResettableServletInputStream();
    this.modifiableParameters = new TreeMap<String, String[]>();
    this.modifiableParameters.putAll(additionalParams);
	}

	public void resetInputStream(byte[] newRawData) {
		servletStream.stream = new ByteArrayInputStream(newRawData);
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		if (rawData == null) {
			rawData = IOUtils.toByteArray(this.request.getReader());
			servletStream.stream = new ByteArrayInputStream(rawData);
		}
		return servletStream;
	}

	@Override
	public BufferedReader getReader() throws IOException {
		if (rawData == null) {
			rawData = IOUtils.toByteArray(this.request.getReader());
			servletStream.stream = new ByteArrayInputStream(rawData);
		}
		return new BufferedReader(new InputStreamReader(servletStream));
	}

	private class ResettableServletInputStream extends ServletInputStream {

		private InputStream stream;

		@Override
		public int read() throws IOException {
			return stream.read();
		}
	}
	
  @Override
  public String getParameter(final String name) {
      String[] strings = getParameterMap().get(name);
      if (strings != null) {
          return strings[0];
      }
      return super.getParameter(name);
  }

  @Override
  public Map<String, String[]> getParameterMap() {
      if (allParameters == null) {
          allParameters = new TreeMap<String, String[]>();
          allParameters.putAll(super.getParameterMap());
          allParameters.putAll(modifiableParameters);
      }
      // Return an unmodifiable collection because we need to uphold the interface contract.
      return Collections.unmodifiableMap(allParameters);
  }

  @Override
  public Enumeration<String> getParameterNames() {
      return (Enumeration<String>) Collections.enumeration(getParameterMap().keySet());
  }

  @Override
  public String[] getParameterValues(final String name) {
      return getParameterMap().get(name);
  }
	
  public void setParameters(Map<String, String[]> additionalParams){
  	this.modifiableParameters.putAll(additionalParams);
  }

  public String getHeader(String name) {
    String header = super.getHeader(name);
    return (header != null) ? header : super.getParameter(name); // Note: you can't use getParameterValues() here.
}
  
}
